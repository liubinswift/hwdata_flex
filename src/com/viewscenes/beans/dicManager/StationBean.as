package com.viewscenes.beans.dicManager
{
	import com.viewscenes.beans.BaseBean;
	[RemoteClass(alias="com.viewscenes.bean.dicManager.StationBean")]
	public class StationBean extends BaseBean
	{
		public var station_id:String="";
		public var name:String="";
		public var code:String="";
		public var country:String="";
		public var province:String="";
		public var city:String="";
		public var county:String="";
		public var address:String="";
		public var longitude:String="";
		public var latitude:String="";
		public var is_delete:String="";
		public var gid:String="";
		public var station_type:String="";
		public var broadcast_direction:String="";
		
		public function StationBean()
		{
		}
	}
}