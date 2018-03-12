package com.viewscenes.beans.devicemgr
{
	import com.viewscenes.beans.BaseBean;
	[RemoteClass(alias="com.viewscenes.bean.devicemgr.RadioEquInstallBean")]
	public class RadioEquInstallBean extends BaseBean
	{
		public var id:String="";
		public var head_id:String="";
		public var head_code:String="";
		public var head_name:String="";
		public var equ_id:String="";
		public var equ_name:String="";
		public var save_place:String="";
		public var status:String="";
		public var mail_time:String="";
		public var order_no:String="";
		public function RadioEquInstallBean()
		{
			super();
		}
	}
}