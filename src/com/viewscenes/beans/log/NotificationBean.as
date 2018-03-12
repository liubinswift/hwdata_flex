package com.viewscenes.beans.log
{
	import com.viewscenes.beans.BaseBean;

	[RemoteClass(alias="com.viewscenes.bean.NotificationBean")]
	public class NotificationBean extends BaseBean
	{
		
		
		public var id:String =  "";
		public var from_userid:String =  "";
		public var create_time:String =  "";
		public var to_userid:String =  "";
		public var check_userid:String =  "";
		public var description:String =  "";
		public var start_time:String =  "";
		public var end_time:String =  "";
		public var msg_checked:String = "";
		
		public var from_username:String =  "";
		public var to_username:String =  "";

		public function NotificationBean()
		{
			
		}
	}
}