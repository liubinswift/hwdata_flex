package com.viewscenes.beans.freqtimetab
{
	import com.viewscenes.beans.BaseBean;
	
	
	[RemoteClass(alias="com.viewscenes.bean.freqtimetab.HWLDFreqBean")]
	public class HWLDFreqBean extends BaseBean
	{
		public var broadcast_time:String="";
		public var local_start_time:String="";
		public var local_end_time:String="";
		public var service_area:String="";
		public var freq:String;
		public var launch_country:String="";
		public var sendcity:String="";
		public var sentcity_id:String="";
		public var redisseminators:String;
		public var language:String="";
		public var language_id:String="";
		public var direction:String="";
		public var antenna:String="";
		public var mon_area:String="";
		public var xg_mon_area:String="";
		public var valid_start_date:String="";
		public var valid_start_time:String="";
		public var valid_end_date:String="";
		public var valid_end_time:String="";
		public var rest_datetime:String="";
		public var summer:String="";
		public var summer_starttime:String="";
		public var summer_endtime:String="";
		public var seasonType:String="";//季节类型
		public function HWLDFreqBean()
		{
		}
	}
}