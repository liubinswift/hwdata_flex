package com.viewscenes.beans.log
{
	import com.viewscenes.beans.BaseBean;
	
	[RemoteClass(alias="com.viewscenes.bean.ShiftLogBean")]
	public class ShiftLogBean extends BaseBean
	{
		
		
		public var id:String =  "";
		public var from_userid:String =  "";
		public var create_time:String =  "";
		public var start_time:String =  "";
		public var end_time:String =  "";
		public var description:String =  "";
		public var from_username:String =  "";
		public var douser_name:String =  "";
		
		public function ShiftLogBean()
		{
			
		}
	}
}