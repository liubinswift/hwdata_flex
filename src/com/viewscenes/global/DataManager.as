package com.viewscenes.global
{
	import com.morcha4.RPC.RPCException;
	import com.viewscenes.beans.pub.ResHeadendBean;
	import com.viewscenes.beans.user.PubUserBean;
	import com.viewscenes.global.comp.MM;
	import com.viewscenes.global.comp.Runplan;
	
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import spark.collections.Sort;
	import spark.collections.SortField;

	/*************************
	 * 系统公共数据存放
	 *************************/

	public class DataManager
	{
		
		public static  var server_app_id = "dataServer_app";
		/**
		 *  大洲
		 * */
		[Bindable]
		public static var statetypeColl:ArrayCollection = new ArrayCollection(
			[  {label:"亚洲", data:0}, 
				{label:"欧洲", data:1},
				{label:"非洲", data:2}, 
				{label:"北美洲", data:3},
				{label:"南美洲", data:4}, 
				{label:"大洋洲", data:5},
				{label:"南极洲", data:6} ]);
		[Bindable]
		public  static var bpsColl:ArrayCollection = new ArrayCollection(
			[ {label:"8000", data:"8000"}, 
				{label:"16000", data:"16000"},
				{label:"32000", data:"32000"},
				{label:"64000", data:"64000"},
				{label:"128000", data:"128000"} ]);
		[Bindable]
		public  static var upTypeColl:ArrayCollection = new ArrayCollection(
			[ {label:"不主动上报结果", data:"2"}, 
				{label:"等待间隔后上报", data:"1"}]);
		[Bindable]
		public static var dayofweekColl:ArrayCollection = new ArrayCollection(
			[ {label:"每天", data:"All"}, 
				{label:"周日", data:"0"},
				{label:"周一", data:"1"},
				{label:"周二", data:"2"},
				{label:"周三", data:"3"},
				{label:"周四", data:"4"},
				{label:"周五", data:"5"},
				{label:"周六", data:"6"}]);
		[Bindable]
		public static var bandColl:ArrayCollection = new ArrayCollection(
			[  {label:"短波", data:"0"}, 
				{label:"中波", data:"1"}, 
				{label:"调频", data:"2"} ]);
		[Bindable]
		public static var bandCollWithAll:ArrayCollection = new ArrayCollection(
			[  {label:"全部", data:""}, 
				{label:"短波", data:"0"}, 
				{label:"中波", data:"1"}, 
				{label:"调频", data:"2"} ]);
		/**
		 * 菜单配置 
		 */		
		public static var menu:XML;
		/**
		 * 当前报警数量
		 */
		[Bindable]
		public static var alarmNum:int = 0;
		/**
		 * 当前用户信息
		 */
		public static var user:PubUserBean =new PubUserBean;
		/**
		 * 大洲Bean集合
		 */
		public static var satateBeanArr:ArrayCollection = new ArrayCollection();
		/**
		* 大洲Bean集合带全部的
		*/
		[Bindable]
		public static var satateBeanArrAll:ArrayCollection = new ArrayCollection();
		/**
		 * 站点Bean集合
		 */
		[Bindable]
		public static var headendBeanArr:ArrayCollection = new ArrayCollection();
		
		/**
		 * 站点Bean集合全部带ALL
		 */
		[Bindable]
		public static var headendBeanAll:ArrayCollection = new ArrayCollection();
		/**
		 * 站点Bean集合(遥控站的站点AB当成一个)
		 */
		[Bindable]
		public static var headendNoABArr:ArrayCollection = new ArrayCollection();
		/**
		 * 发射台集合
		 */
		[Bindable]
		public static var stationBeanAll:ArrayCollection = new ArrayCollection();
		/**
		 * 语言集合
		 */
		[Bindable]
		public static var languageBeanAll:ArrayCollection = new ArrayCollection();
		/**
		 * 服务区集合
		 */
		[Bindable]
		public static var serviceAreaBeanAll:ArrayCollection = new ArrayCollection();
		
		public function DataManager()
		{
		}

		
		
		/**
		 * 根据站点code得到站点是否在线。
		 */
		public static function getHeadendIsOnline(code:String):Boolean{
			for(var i:int=0;i<headendBeanArr.length;i++)
			{
				var headend:ResHeadendBean=headendBeanArr.getItemAt(i) as ResHeadendBean;
				if(headend.code==code)
				{
					if(headend.is_online=="true")
					{
						return true;
					}
					else 
						return false;
				}
			}
			return false;	
		}
		
		
		/**
		 * 根据大洲得到站点,stationType:all全部，101采集点，102遥控站。
		 * noabSource:true:通过headendNoABArr查询; false:通过headendBeanArr查询
		 */
		public static function getHeadendByState(state:String,stationType:String,noabSource:Boolean=false):ArrayCollection{
			
			var returnArrayColl:ArrayCollection=new ArrayCollection();
			var tempList:ArrayCollection = headendBeanArr;
			if(noabSource){
				tempList = headendNoABArr;
			}
			for(var i:int=0;i<tempList.length;i++)
			{
				var headend:ResHeadendBean=tempList.getItemAt(i) as ResHeadendBean;
				
				
				if (state == "all"){
					
					if (stationType == "all"){
						returnArrayColl.addItem(headend);
					}else{
						if(headend.type_id==stationType){
							returnArrayColl.addItem(headend);
						}
					}
					
				}else{
					if (stationType == "all"){
						if(headend.state==state){
							returnArrayColl.addItem(headend);
						}
					}else{
						if(headend.state==state&&headend.type_id==stationType){
							returnArrayColl.addItem(headend);
						}
					}
				}
				
			}
							var sort:Sort=new Sort();  
							//sort.fields=[new SortField("shortname")];
							//returnArrayColl.sort=sort;
							returnArrayColl.refresh();
			return returnArrayColl;
		}
		
		/**
		 * 根据名称得到站点
		 */
		public static function getHeadendByName(shortname:String):ResHeadendBean{
			//var returnArrayColl:ArrayCollection=new ArrayCollection();
			for(var i:int=0;i<headendBeanArr.length;i++)
			{
				var headend:ResHeadendBean=headendBeanArr.getItemAt(i) as ResHeadendBean;
				
				if(headend.shortname==shortname){
					//returnArrayColl.addItem( headend);
					return headend;
				}
				
			}
			
			return null;
		}
		/**
		 * 根据code得到站点
		 */
		public static function getHeadendByCode(code:String):ResHeadendBean{
			var returnArrayColl:ArrayCollection=new ArrayCollection();
			for(var i:int=0;i<headendBeanArr.length;i++)
			{
				var headend:ResHeadendBean=headendBeanArr.getItemAt(i) as ResHeadendBean;
				
				if(headend.code==code){
					return headend;
				}
				
			}
			
			return null;
		}

		
		/**
		 * 根据ID得到站点
		 */
		public static function getHeadendById(id:String):ResHeadendBean{
			var returnArrayColl:ArrayCollection=new ArrayCollection();
			for(var i:int=0;i<headendBeanArr.length;i++)
			{
				var headend:ResHeadendBean=headendBeanArr.getItemAt(i) as ResHeadendBean;
				
				if(headend.head_id==id){
					return headend;
				}
				
			}
			
			return null;
		}
		
		
		/**
		 * 返回错误方法，输出错误信息
		 */
		public static function showErrorMessageBack(obj:RPCException,priObj:Object=null):void{
			MM.show(obj.message,"服务器异常");
		}
		/**
		 * 返回错误方法Alert，输出错误信息
		 */
		public static function alertShowErrorMessageBack(obj:RPCException,priObj:Object=null):void{
			Alert.show(obj.message);
		}
		/**
		 * 输出错误信息
		 */
		public static function showErrorMessage(message:String):void{
			MM.show(message,"异常");
		}
		/**
		 * Alert输出错误信息
		 */
		public static function alertShowErrorMessage(message:String):void{
			Alert.show(message);
		}
	}
}