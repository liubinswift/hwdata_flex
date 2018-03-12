package com.viewscenes.beans.dicManager
{
	import com.viewscenes.beans.BaseBean;
	[RemoteClass(alias="com.viewscenes.bean.dicManager.ServiceBeanBean")]
	public class ServiceAreaBean extends BaseBean
	{
		public var id:String="";
		public var chinese_name:String="";
		public var english_name:String="";
		
		public function ServiceAreaBean()
		{
		}
	}
}