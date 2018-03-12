package com.viewscenes.beans.report 
{ 
	/** 
	 * @author zyh 
	 * @explain:  时段效果统计bean
	 * @version 1.0.0 
	 * 创建时间：2013-3-5 下午5:46:37 * 
	 */  
	[RemoteClass(alias="com.viewscenes.bean.report.ZrstRepTimeStatisticsBean")]
	public class ZrstRepTimeStatisticsBean 
	{ 
		public var data_id:String = "";//
		public var report_id:String = "";			//报表id
		public var receive_name:String = "";		//遥控站名
		public var transmit_station:String = "";	//发射台
		public var language_name:String = "";		//语言
		public var freq_type:String = "";			//频率类型 如：6M
		public var time_listens:String = "";		//24小时时间段的可听率集合 如：1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19_20_21_22_23_24
		public var sub_report_type:String = "";			//子报表类型 1、语言  2、发射台   3、频段
		
		public function ZrstRepTimeStatisticsBean()
		{
		}
	}
} 