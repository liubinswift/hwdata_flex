package com.viewscenes.beans
{
	/**
	 * 资源录入对象类
	 * */
	[RemoteClass(alias="com.viewscenes.bean.DataInputBean")]
	public class DataInputBean extends BaseBean
	{
		
		public var data_id:String = "";
		public var data_type:String = "";
		public var freq:String = "";
		public var language_id:String = "";
		public var language_name:String = "";
		public var station_id:String = "";
		public var station_name:String = "";
		public var power:String = "";
		public var direction:String = "";
		public var service_area:String = "";
		public var ciraf:String = "";
		public var receive_country:String = "";
		public var receive_city:String = "";
		public var datasource:String = "";
		public var start_time:String = "";
		public var end_time:String = "";
		public var receive_date:String = "";
		public var receive_time:String = "";
		public var program_type:String = "";
		public var field_strength:String = "";
		public var s:String = "";
		public var i:String = "";
		public var o:String = "";
		public var level_value:String = "";
		public var remark:String = "";
		
		public function DataInputBean()
		{
		}
	}
}