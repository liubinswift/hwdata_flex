package com.viewscenes.beans.dicManager
{
	import com.viewscenes.beans.BaseBean;
	[RemoteClass(alias="com.viewscenes.bean.dicManager.AzimuthBean")]
	public class AzimuthBean extends BaseBean
	{
		public var id:String="";
		public var station_name:String="";
		public var city_name:String="";
		public var circle_distance:String="";
		public var azimuth:String="";
		public var longitude:String="";
		public var latitude:String="";
		public function AzimuthBean()
		{
		}
	}
}