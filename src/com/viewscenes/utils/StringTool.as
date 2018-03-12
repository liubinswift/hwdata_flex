package com.viewscenes.utils
{
	
	import com.viewscenes.beans.pub.BandBean;
	import com.viewscenes.global.DataManager;
	
	import flash.utils.ByteArray;
	
	import mx.accessibility.AlertAccImpl;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	
	import spark.components.DropDownList;
	
	public class StringTool
	{
		public function StringTool()
		{
		}
		
		
		/**
		 * 
		 *根据频率算出波段 
		 */
		public static function getBandFromFreq(freq:String):String {
			var band:String = "";
			if (freq != null && freq.length > 0) { //由频率计算波段
				
				var fFreq:int =new  Number(freq);
				if (fFreq >= 531 && fFreq <= 1602) { //中波
					band = "1";
				}
				else if (fFreq >= 2300 && fFreq <= 26100) { //短波
					band = "0";
				}
				else if (fFreq >= 87000 && fFreq <= 108000) { //调频
					band = "2";
				}
			}
			return band;
		}
		/**
		 * 
		 *根据已知值选中下拉框中的下拉项
		 */
		public static function getDropDownListIndex(dropDownList:DropDownList,myValue:String):void {
	       for(var i:int=0;i<dropDownList.dataProvider.length;i++)   
		   {
			   if(dropDownList.dataProvider.getItemAt(i).data==myValue)
			   {
				   dropDownList.selectedIndex=i; 
			   }
		   }
		}
		/**
		 * 为发送到后台的object参数添加默认的headcode、ip、priority
		 */
		public static function addHead(obj:Object):Object{
			//			obj.head_id = DataManager.currHeadend.head_id;
			//			obj.headcode = DataManager.currHeadend.code;
			//			obj.ip = DataManager.currHeadend.ip;
			//			obj.priority = DataManager.currUser.priority;
			obj.userId = DataManager.user.userId
			obj.priority = DataManager.user.priority;
			return obj;
		}
		
		
		/**
		 * 对象克隆
		 */ 
		public static function clone(source:Object):*{
			var myBa:ByteArray = new ByteArray();
			myBa.writeObject(source);
			myBa.position = 0;
			return (myBa.readObject());
		}
		
		/**
		 * 返回波段列表
		 */ 
		public static function getBandList():ArrayCollection{
			var bandArray:ArrayCollection = new ArrayCollection;
			for(var i:int = 0; i<3;i++){
				var band:BandBean = new BandBean;
				if (i == 0)
					band.name = "短波";
				else if (i == 1)
					band.name = "中波";
				else
					band.name = "调频";
				band.value = i+"";
				bandArray.addItem(band);
			}
			
			var band1:BandBean = new BandBean;
			band1.name = "全部";
			band1.value = "";
			bandArray.addItemAt(band1,0);
			return bandArray;
		}
		
		
		/**
		 * 
		 *判断频率是否合法 
		 */
		public static function checkFreq(freq:String):Boolean {
			
			if (freq != null && freq.length > 0) { //由频率计算波段
				
				var fFreq:int =new  Number(freq);
				if ((fFreq >= 531 && fFreq <= 1602) || (fFreq >= 2300 && fFreq <= 26100) || (fFreq >= 87000 && fFreq <= 108000) ) { //中波
					return true;
				}else{
					return false;
				}
				
			}else{
				return false;
			}
		}
		
		/**
		 * ac:数据源
		 * field:查找数据源中的属性名称
		 * value:要与数据源中指定属性名称值匹配的值
		 * return:返回value 在数据源中的位置
		 */ 
		public static function getSelectIndex(ac:IList,field:String,value:Object):int{
			var retVal:int = -1;
			if (ac != null && ac.length >0){
				
				for(var i:int=0;i<ac.length;i++){
					if (field == null || field == ""){
						if (ac[i] == value){
							retVal = i;
							break;
						}
					}else if (ac[i][field] == value){
						retVal = i;
						break;
					}
				}
				
			}else{
				retVal = -1;
			}
			return retVal;
		}
	}
	
}