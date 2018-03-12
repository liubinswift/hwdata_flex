package com.viewscenes.beans
{
	import com.viewscenes.beans.runplan.RunplanBean;
	import com.viewscenes.beans.task.Task;
	
	import flashx.textLayout.formats.Float;

	/**
	 * 基于频率的效果统计类与结果类
	 */ 
	[RemoteClass(alias="com.viewscenes.bean.EffectStatCommonBean")]
	public class EffectStatCommonBean
	{
		public var  freq:String = "";				//频率
		public var  language_name:String = "";		//语言
		public var  station_name:String = "";		//发射台名称
		public var  rebroadcastorg:String = "";		//转播机构
		public var  receivearea:String = "";		//收测地区
		public var  receivedate:String = "";		//收测时间
		public var  o:String = "";					//可听度
		public var  start_time:String = "";			//运行图播音开始时间
		public var  end_time:String = "";			//运行图播音结束时间	
		public var  disturb:String = "";			//运行图受干扰情况
		public var  level_value:Float = 0;			//电平值
		public var  service_area:String = "";		//运行图服务区
		public var freqcount:int = 0;				//频率数
		public var freqtime:Float  = 0;				//频时数
		public var headname:String = "";			//站点名称
		public var receivecount:int = 0;			//收测次数
		public var goodfreqtime:Float = 0;			//可保证收听频时数	
		//下面字段只在统计完成后使用

		public var receivecount:int = 0;			//收测总次数
		
		public var  audibility1:int = 0;			//可听度满意度
		public var  audibility2:int = 0;
		public var  audibility3:int = 0;
		public var  audibility4:int = 0;
		public var  audibility5:int = 0;

		public var  audibilityMiddleValue:int = 0;	//可听度中值
		
		
		public var  audible:Float = 0;				//可听率
		
		public function EffectStatByFreqBean()
		{
		}
	}
}