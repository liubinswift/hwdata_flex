package com.viewscenes.beans.runplan
{
	import com.viewscenes.beans.BaseBean;
	[RemoteClass(alias="com.viewscenes.bean.runplan.DisRunplanBean")]
	public class DisRunplanBean extends BaseBean
	{
		public function DisRunplanBean()
		{
			super();
		}
		public var disrun_id:String="";
		public var runplan_id:String="";
		public var station_id:String="";
		public var sencity_id:String="";
		public var transmiter_no:String="";
		public var freq:String="";
		public var language:String="";
		public var start_time:String="";
		public var end_time:String="";
		public var valid_start_time:String="";
		public var valid_end_time:String="";
		public var disturb:String="";
		public var is_delete:String="";
		public var sencity:String="";
		public var station_name:String="";
		public var power:String="";
		public var redisseminators:String="";
		public var receive_country:String="";
		public var receive_city:String="";
		public var type:String="";
		public var receive_station:String="";
	}
}