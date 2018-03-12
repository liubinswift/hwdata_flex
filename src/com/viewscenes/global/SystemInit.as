package com.viewscenes.global
	
{
	import com.morcha4.RPC.RPCException;
	import com.morcha4.RPC.RPCManager;
	import com.morcha4.RPC.request.RORequestParam;
	import com.morcha4.frame.system.AdvancedEvent;
	import com.morcha4.frame.system.EventBus;
	import com.morcha4.frame.theme.StyleManager;
	import com.viewscenes.beans.ClientInfo;
	import com.viewscenes.beans.ReportBean;
	import com.viewscenes.beans.ZdicLanguageBean;
	import com.viewscenes.beans.dicManager.ServiceAreaBean;
	import com.viewscenes.beans.dicManager.StationBean;
	import com.viewscenes.beans.log.NotificationBean;
	import com.viewscenes.beans.pub.DicStateBean;
	import com.viewscenes.beans.pub.ResHeadendBean;
	import com.viewscenes.beans.report.OriginalEffectBean;
	import com.viewscenes.beans.report.ZrstRepEffectStatisticsBean;
	import com.viewscenes.beans.report.ZrstRepFreqStatisticsBean;
	import com.viewscenes.beans.report.ZrstRepTimeStatisticsBean;
	import com.viewscenes.beans.task.CycleSubTask;
	import com.viewscenes.beans.task.SingleSubTask;
	import com.viewscenes.beans.task.Subtask;
	import com.viewscenes.beans.task.Task;
	import com.viewscenes.beans.user.PubRoleBean;
	import com.viewscenes.module.log.ShowMessage;
	import com.viewscenes.utils.StringTool;
	
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.StyleEvent;
	import mx.managers.BrowserManager;
	import mx.managers.PopUpManager;

	/**
	 *@作者:wxb
	 *@创建时间：2012-3-1上午10:17:43
	 * 系统登陆成功后需要初始化的数据
	 * 
	 * 每个初始化函数都需要发送EventDeclare.SYSTEM_INIT_STATE事件，该事件通知用户系统正在做什么；
	 * 该事件的参数data中 
	 * flag为初始化标志只能为0或1 1表示正确初始化完毕，0表示正在初始化或初始化错误 ，
	 * message为通知用户的信息
	 * 
	 *
	 **/
	public class SystemInit
	{
		
		
		public static var initFuncNum:int = 7;  //初始化数据函数+登陆函数的总数量，添加初始化函数需要改动该值
		public static var completeNum:int = 0; //完成初始化并正确的函数数量
		
		public function SystemInit()
		{
			
			Alert.okLabel = "确定";
			Alert.cancelLabel = "取消";
			
			
			this.getMenu();
//			
//			
//			
//			this.getNavImgList();
//			
//			
//			this.getStyle();
//			
			this.getConfigData();
			this.getConfigDataStation();
			this.getConfigDataLanguage();
			this.getConfigDataServiceArea();
			this.queryHeadList();
			this.initBean();
		
		}
	
		
		/**
		 * 设置默认css样式
		 */
		private function getStyle():void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取皮肤"}));
			com.morcha4.frame.theme.StyleManager.loadSkin("DefaultStyle.swf",null,onStyleComplete,onStyleError);
		}
		private function onStyleComplete(e:StyleEvent):void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"皮肤加载完毕"}));
			//			setTimeout(function(){com.morcha4.frame.theme.StyleManager.removeSkin("com/viewscenes/theme/DefaultStyle.swf");},5000);
			//			setTimeout(function(){com.morcha4.frame.theme.StyleManager.loadSkin("com/viewscenes/theme/DefaultStyle.swf",null,onStyleComplete,onStyleError);},10000);
		}
		private function onStyleError(e:StyleEvent):void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"皮肤加载失败"}));
		}
		
		
		/**
		 * 获取系统公共数据
		 */
		public function getConfigData():void
		{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取配置数据"}));
			
			var obj:Object = new Object;
			
			RPCManager.sendCmd(new RORequestParam("com.viewscenes.web.common.Common","getConfigData",obj,configDataBack,onFault));
		}
		
		private function configDataBack(list:ArrayCollection):void
		{
			
//			DataManager.provinceCode = obj["location_code"];
			DataManager.satateBeanArr = list.getItemAt(0) as ArrayCollection;
			DataManager.headendBeanArr = list.getItemAt(1) as ArrayCollection;
			
			var arr:ArrayCollection = StringTool.clone(DataManager.headendBeanArr);
			
			DataManager.headendBeanAll = arr;
			var allHead:ResHeadendBean = new ResHeadendBean();
			allHead.shortname = "全部";
			DataManager.headendBeanAll.addItemAt(allHead,0);
			
			var allState:DicStateBean = new DicStateBean();
			allState.state_name = "全部";
			allState.state = "100";
			var arrState:ArrayCollection = StringTool.clone(DataManager.satateBeanArr);
			DataManager.satateBeanArrAll = arrState;
			DataManager.satateBeanArrAll.addItemAt(allState,0);
	
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"配置数据加载完毕"}));
			
			
		}
		
		/**
		 * 获取系统公共数据--发射台
		 */
		public function getConfigDataStation():void
		{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取发射台配置数据"}));
			
			var obj:Object = new Object;
			
			RPCManager.sendCmd(new RORequestParam("com.viewscenes.web.common.Common","getStationList",false,getConfigDataStationBack,onFault));
		}
		
		private function getConfigDataStationBack(list:ArrayCollection):void
		{
			DataManager.stationBeanAll = list;
			var stationBean:StationBean = new StationBean();
			stationBean.name = "全部";
			stationBean.station_id= "";
			DataManager.stationBeanAll.addItemAt(stationBean,0);
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"发射台配置数据加载完毕"}));
		}
		
		/**
		 * 获取系统公共数据--语言
		 */
		public function getConfigDataLanguage():void
		{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取语言配置数据"}));
			
			var obj:Object = new Object;
			
			RPCManager.sendCmd(new RORequestParam("com.viewscenes.web.common.Common","getLanguageList",obj,getConfigDataLanguageBack,onFault));
		}
		
		private function getConfigDataLanguageBack(list:ArrayCollection):void
		{
			DataManager.languageBeanAll = list;
		    var languageBean:ZdicLanguageBean = new ZdicLanguageBean();
			languageBean.language_name="全部";
			languageBean.language_id = "";
			DataManager.languageBeanAll.addItemAt(languageBean,0);
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"语言配置数据加载完毕"}));
		}
		
		/**
		 * 获取系统公共数据--服务区
		 */
		public function getConfigDataServiceArea():void
		{
			
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取服务区配置数据"}));
			
			var obj:Object = new Object;
			
			RPCManager.sendCmd(new RORequestParam("com.viewscenes.web.common.Common","getServiceAreaList",obj,getConfigDataServiceAreaBack,onFault));
		}
		
		private function getConfigDataServiceAreaBack(list:ArrayCollection):void
		{
			DataManager.serviceAreaBeanAll = list;
			var serviceBean:ServiceAreaBean = new ServiceAreaBean();
			serviceBean.chinese_name="全部";
			serviceBean.id="";
			DataManager.serviceAreaBeanAll.addItemAt(serviceBean,0);
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"服务区配置数据加载完毕"}));
		}
		
		/**
		 * 加载初始化bean
		 */
		private function initBean():void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"加载初始化BEAN"}));
			
			
			var beanTemp;
			beanTemp is Task;
			beanTemp is Subtask;
			beanTemp is SingleSubTask;
			beanTemp is CycleSubTask;
			beanTemp is ClientInfo;
			beanTemp is PubRoleBean;
			beanTemp is ReportBean;
			beanTemp is ZrstRepEffectStatisticsBean;
			beanTemp is OriginalEffectBean;
			beanTemp is ZrstRepFreqStatisticsBean;
			beanTemp is ZrstRepTimeStatisticsBean;
			
			
			
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"初始化BEAN完毕"}));
		}
		
		
		/**
		 * 获取站点数据
		 */
		public function queryHeadList():void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取站点数据"}));
			var bean:ResHeadendBean = new ResHeadendBean();
			var request:RORequestParam = new RORequestParam("com.viewscenes.web.common.Common","getHeadendListDistinct",bean,queryHeadListBack,DataManager.showErrorMessageBack);
			RPCManager.sendCmd(request); 
		}
		
		private function queryHeadListBack(list:ArrayCollection):void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"获取站点数据完毕"}));
			for(var i:int=0;i<list.length;i++){
				var obj:Object = list.getItemAt(i);
				obj.shortname = obj.shortname_noab;
				obj.code = obj.code_noab;
				obj.is_delete = "0";
				list.setItemAt(obj,i);
			}
			DataManager.headendNoABArr = list;
		}
		
		
		
		
		/**
		 * 
		 * 获取用户菜单
		 * 加载完毕后将数据存储到DataManager.menu对象中
		 * 
		 * */
		private function getMenu():void{
			
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取菜单数据"}));
			
			var obj:Object = new Object;
			obj.roleId = DataManager.user.roleId;
			obj.userName = DataManager.user.userName;
			obj.broadcast_type = "1";
			
			RPCManager.sendCmd(new RORequestParam("com.viewscenes.web.common.Common","getUserMenu",obj,menuBack,onFault));
		}
		
		private function menuBack(obj:Object):void
		{
		
			
			DataManager.menu = new XML(obj as String);
			//Alert.show(DataManager.menu.toString());
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"菜单数据加载完毕"}));
			
			
		}
		
		
		
		/**
		 * 
		 * 获取导航菜单图标
		 * */
		private function getNavImgList():void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:"获取导航菜单"}));
			
			var obj:Object = new Object;
			
			RPCManager.sendCmd(new RORequestParam("com.viewscenes.framework.manager.appManagement.SystemServiceManager","getNavImgList",obj,navImgListBack,onFault));
		}
		
		private function navImgListBack(obj:Object):void
		{
			
//			DataManager.navImgList = obj;
			
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:1,message:"导航菜单加载完毕"}));
		}
		
		
		
		/**
		 * 
		 * 错误处理
		 * */
		private function onFault(e:RPCException):void{
			EventBus.dispatchEvent(new AdvancedEvent(EventDeclare.SYSTEM_INIT_STATE,false,false,{flag:0,message:e.message}));
		}
		
	}
}
