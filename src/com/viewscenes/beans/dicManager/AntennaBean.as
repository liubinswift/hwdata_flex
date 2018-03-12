package com.viewscenes.beans.dicManager
{
	import com.viewscenes.beans.BaseBean;
	/**
	 * 天线参数bean
	 * @author:王福祥
	 * @date:2012/09/18
	 * */
	[RemoteClass(alias="com.viewscenes.bean.dicManager.AntennaBean")]
	public class AntennaBean extends BaseBean
	{
		public var id:String="";
		public var station_name:String="";
		public var antenna_no:String="";
		public var antenna_mode:String="";
		public var itu:String="";
		public var direction:String="";
		public var service_area:String="";
		public var ciraf:String="";
		public var address:String="";
		public var shiypd:String="";
		public var remark:String="";
		public function AntennaBean()
		{
		}
	}
}