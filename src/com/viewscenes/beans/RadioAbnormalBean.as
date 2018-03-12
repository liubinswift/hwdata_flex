package com.viewscenes.beans
{
	[RemoteClass(alias="com.viewscenes.bean.RadioAbnormalBean")]
	public class RadioAbnormalBean extends BaseBean
	{
		public var id:String = "";
		public var send_county:String = "";
		public var send_city:String = "";
		public var broadcasting_organizations:String = "";
		public var remote_station:String = "";
		public var collection_point:String = "";
		public var frequency:String = "";
		public var language_id:String = "";
		public var language_name:String = "";
		public var station_id:String = "";
		public var station_name:String = "";
		public var tran_no:String = "";
		public var power:String = "";
		public var get_type:String = "";
		public var abnormal_type:String = "";
		public var abnormal_date:String = "";
		public var starttime:String = "";
		public var endtime:String = "";
		public var type:String = "";
		public var remark:String = "";
		public var play_time:String = "";
		public var is_proofread:String = "";
		public var is_audit:String = "";
		public var end_date:String="";
		public var insert_person:String="";
		public var proof_person:String="";
		public var audit_person:String="";
		public function RadioAbnormalBean()
		{
		}
	}
}