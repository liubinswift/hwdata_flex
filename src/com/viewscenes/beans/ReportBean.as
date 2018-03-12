package com.viewscenes.beans
{
	[RemoteClass(alias="com.viewscenes.bean.ReportBean")]
	public class ReportBean extends BaseBean
	{
		
		public var report_id:String =  "";
		public var report_date:String =  "";
		public var report_type:String =  "";
		public var period_type:String =  "";
		public var start_datetime:String =  "";
		public var end_datetime:String =  "";
		public var character:String =  "";
		public var data_num:String =  "";
		
		public var modify_status:String =  "";
		public var modify_user:String =  "";
		public var modify_datetime:String =  "";
		public var import_status:String =  "";
		public var import_user:String =  "";
		public var import_datetime:String =  "";
		public var verify_status:String =  "";
		public var verify_user:String =  "";
		public var verify_datetime:String =  "";
		

		public var authentic_status:String =  "";
		public var authentic_user:String =  "";
		public var authentic_datetime:String =  "";
		public var remark:String =  "";

		public function ReportBean()
		{
		}
	}
}



