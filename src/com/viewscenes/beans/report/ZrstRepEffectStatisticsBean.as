package com.viewscenes.beans.report
{
	[RemoteClass(alias="com.viewscenes.bean.report.ZrstRepEffectStatisticsBean")]
	public class ZrstRepEffectStatisticsBean
	{
		public var data_id:String = "";			//
		public var report_id:String = "";			//报表id
		public var play_time:String = "";			//播音时间
		public var language_name:String = "";		//语言
		public var freq:String = "";				//频率
		public var transmit_station:String = "";	//发射台
		public var transmit_direction:String = "";	//发射方向
		public var transmit_power:String = "";		//发射功率
		public var service_area:String = "";		//服务区
		public var receive_code:String = "";		//收测地点
		public var receive_count:String = "";		//收测次数
		public var fen0:String = "";				//0分的
		public var fen1:String = "";				//1分的
		public var fen2:String = "";				//2分的
		public var fen3:String = "";				//3分的
		public var fen4:String = "";				//4分的
		public var fen5:String = "";				//5分的
		public var listen:String = "";				//可听率%
		public var listen_middle:String = "";		//可听度中值
		public var bak:String = "";				//备注
		public var receive_name:String = "";		//遥控站名
		public var transmit_station_listens:String = "";//发射台_>=3分_总次数_可听率%  例如：2022_88_123_78,2032_23_423_28
		public var receive_name_total_hours:String = "";//遥控站名_总频时  例如：大阪_96,吉隆坡_34
		public var receive_listens:String = "";		 //保证收听频时	_基本可收听频时	_有时可收听频时_	无法收听频时_总频时
		public var language_name_listens:String = "";	 //语言_>=3分_总次数_可听率%  例如：德_88_123_78,2032_23_423_28
		public var state_name:String = "";			//地区 如：欧洲
		public var month_listens:String = "";		//各月可听率 一月_二月_三月_四月_五月_六月_七月_八月_九月_十月_十一月_十二月 如：1_2_3_4_5_7_8_8_2_10_33_44
		public var average_listens:String = "";	//平均可听率%
		public var sub_report_type:String = "";	//子报表类型  11：国际台广播效果统计；21：发射台总体播出效果统计1；22：发射台总体播出效果统计2；
													//23：发射台总体播出效果统计3；31：语言总体播出效果统计1；32：语言总体播出效果统计2；
													//41：各遥控站、各地区、各大洲、可听率统计；51：各遥控站、各地区、各大洲、可保证收听频时统计；61：各月可听率对比；71：频率平均可听率统计表
		public var all_listens:String = "";        //地区或大洲_>=3分_总次数_可听率% 
		
		public var valid_start_time_temp:String = ""; 
		public var valid_end_time_temp:String = ""; 
		public var runplan_type_id_temp:String = ""; 
		public function ZrstRepEffectStatisticsBean()
		{
		}
	}
}