package com.viewscenes.beans.user
{
	[RemoteClass(alias="com.viewscenes.web.sysmgr.user.PubRoleBean")]

	public class PubRoleBean
	{
		public var role_id:String = "";
		public var name:String = "";
		public var description:String = "";
		public var priority:String = "";
		
		
		public function PubRoleBean()
		{
		}
	}
}