package com.viewscenes.beans.runplan
{
	import com.viewscenes.beans.BaseBean;

	/**国际台落地运行图bean
	 *@作者:王福祥
	 *@创建时间：2012/07/19
	 * */
	[RemoteClass(alias="com.viewscenes.bean.runplan.GJTLDRunplanBean")]
	public class GJTLDRunplanBean extends BaseBean
	{
		
		public var runplan_id:String="";      //运行图id
		public var runplan_type_id:String=""; //运行图类型id
		public var launch_country:String="";  //发射国家
		public var sentcity_id:String="";    //发射城市id
		public var sentcity:String="";       //发射城市
		public var redisseminators:String="";  //转播机构
		public var freq:String="";           //频率
		public var band:String="";          //波段
		public var direction:String="";      //方向
		public var program_id:String="";        //节目id
		public var program_name:String="";      // 节目名称
		public var language_id:String="";    //语言id
		public var language:String="";       //语言名称
		public var power:String="";          //功率
		public var service_area:String="";   //服务区
		public var start_time:String="";       //播音开始时间
		public var end_time:String="";         //播音结束时间
		public var local_time:String=""        //当地时间
		public var mon_area:String="";         //质量收测站点
		public var mon_area_name:String="";         //质量收测站点名称
		public var xg_mon_area:String="";      //效果收测站点
		public var xg_mon_area_name:String="";      //效果收测站点名称
		public var rest_datetime:String="";    //休息日期
		public var valid_start_time:String=""; //启用期
		public var valid_end_time:String="";  //停用期
		public var remark:String="";           //备注
		public var summer:String="";           // 夏令时
		public var summer_starttime:String=""; //夏令时启用时间
		public var summer_endtime:String="";   //夏令时停用时间
		public var selected:String="";
		public var input_person:String="";   //录入人
		public var local_start_time:String="";//当地播音开始时间
		public var local_end_time:String="";//当地播音结束时间
		public var type_id:String="";//站点类型 101: 采集点 ;102 :遥控站
		public var weekday:String="";//周设置
		public function GJTLDRunplanBean()
		{
		}
	}
}