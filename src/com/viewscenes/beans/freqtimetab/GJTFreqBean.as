package com.viewscenes.beans.freqtimetab
{
	import com.viewscenes.beans.BaseBean;
	

	[RemoteClass(alias="com.viewscenes.bean.freqtimetab.GJTFreqBean")]
	public class GJTFreqBean extends BaseBean
	{
		public var broadcast_time:String="";
		public var service_area:String="";
		public var freq:String="";
		public var station:String="";
		public var station_id:String="";
		public var power:String="";
		public var direction:String="";
		public var language:String="";
		public var language_id:String="";
		public var transmiter_no:String="";
		public var antenna:String="";
		public var ykz:String="";
		public var program_type:String="";
		public var ciraf:String="";
		public var valid_start_date:String="";
		public var valid_start_time:String="";
		public var valid_end_date:String="";
		public var valid_end_time:String="";
		public var season_id:String="";
		public var is_now:String="";
		public var mon_area:String="";
		public var xg_mon_area="";
		public function GJTFreqBean()
		{
		}
	}
}