package com.viewscenes.beans
{
	[RemoteClass(alias="com.viewscenes.bean.EquipmentMaintenanceBean")]
	public class EquipmentMaintenanceBean extends BaseBean
	{
		
		
		public var data_id:String =  "";
		public var report_id:String =  "";
		public var head_name:String =  "";
		public var head_code:String =  "";
		public var starttime:String =  "";
		public var endtime:String =  "";
		public var count:String =  "";
		public var type:String =  "";
		public var type_name:String =  "";
		public var handle:String =  "";
		public var handle2:String =  "";
		public var remark:String =  "";
		public var is_delete:String =  "";
		public var equ:String="";
		public var advice:String="";
		
		public function EquipmentMaintenanceBean()
		{
			super();
		}
	}
}