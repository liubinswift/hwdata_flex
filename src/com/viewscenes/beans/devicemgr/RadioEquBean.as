package com.viewscenes.beans.devicemgr
{
	
	import com.viewscenes.beans.BaseBean;
	
	import flash.net.FileReference;
	
	/**
	 * 城市维护类
	 * */
	[RemoteClass(alias="com.viewscenes.bean.devicemgr.RadioEquBean")]
	public class RadioEquBean extends BaseBean
	{
		
		public var id:String = "";              //id
		public var head_id:String = "";         //head_id
		public var installation:String = "";    //安装情况
		public var use_case:String = "";         //使用情况
		
		public var fault:String = "";           //故障情况
		public var replacement:String = "";     //更换情况
		public var maintain:String = "";        //维护情况
		public var equ_number:String = "";      //设备数量
		
		public var equ_id:String = "";           //设备编号
		public var head_code:String = "";       //head_code
		public var main_datetime:String = ""; 	//维护时间
		public var head_name:String = "";   	//站点名称S
		public var pic_path:String="";
		
		public var country:String="";			//国家
		public var state_name:String="";			//大洲
		public var start_time:String="";      	//故障开始时间
		public var end_time:String="";			//故障结束时间
		public var person:String="";			//维护人
		public var resault:String="";			//处理结果
		public var record_path:String="";		//录音文件路径
		public var old_equ:String="";
		public var old_place:String="";
		public var old_status:String="";
		public var new_equ:String="";
		public var new_from:String="";
		public var mail_order:String="";
		public var mail_time:String="";
		public function RadioEquBean()
		{
		}
	}
}