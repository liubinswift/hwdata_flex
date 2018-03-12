package com.viewscenes.beans.report 
{ 
	/** 
	 * @author zyh 
	 * @explain:  频段效果统计bean
	 * @version 1.0.0 
	 * 创建时间：2013-3-5 下午5:39:14 * 
	 */  
	[RemoteClass(alias="com.viewscenes.bean.report.ZrstRepFreqStatisticsBean")]
	public class ZrstRepFreqStatisticsBean 
	{ 
		public var data_id:String = "";//
		public var report_id:String = "";			//报表id
		public var receive_name:String = "";		//遥控站名
		public var transmit_station:String = "";	//发射台
		public var language_name:String = "";		//语言
		public var play_time:String = "";			//各时段 如：01:00-02:00
		public var freq_listens:String = "";		//6到25m可听率集合 如：6_7_9_11_13_15_17_19_21_25
		public var sub_report_type:String = "";			//子报表类型 1、语言  2、发射台   3、时段
		
		public function ZrstRepFreqStatisticsBean()
		{
		}
		
	}
} 