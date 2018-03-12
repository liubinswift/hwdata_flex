package com.viewscenes.beans.report 
{ 
	/** 
	 * @author zyh 
	 * @explain:  
	 * @version 1.0.0 
	 * 创建时间：2013-2-26 下午5:31:07 * 
	 */  
	[RemoteClass(alias="com.viewscenes.bean.report.OriginalEffectBean")]
	public class OriginalEffectBean 
	{ 
		public var language_name:String = "";//语言
		public var freq:String = "";//频率
		public var play_time:String = "";//播音时间
		public var transmit_name:String = "";//发射台名
		public var transmit_direction:String = "";//发射方向
		public var transmit_power:String = "";//发射功率
		public var service_area:String = "";//服务区
		public var ciraf:String = "";//ciral区
		public var receive_date:String = "";//收测日期
		public var receive_time:String = "";//收测时间
		public var receive_station_yaokong:String = "";//遥控站  收测站点
		public var receive_station_caiji:String = "";//采集点 收测站点
		public var fens:String = "";//分值S
		public var feni:String = "";//分值I
		public var feno:String = "";//分值O
		public var level:String = "";//电平
		public var bak:String = "";//备注
		
		public var transmit_country:String = "";//发射国家
		public var transmit_city:String = "";//发射城市:String = "";
		public var redisseminators:String = "";//转播机构
		public var type:String = "";//1、国际台节目原始记录；2、海外落地节目原始记录
		public function OriginalEffectBean()
		{
		}
	}
} 