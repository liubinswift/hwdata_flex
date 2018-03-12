package com.viewscenes.utils.tools
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.controls.listClasses.ListBase;
	
	public class CheckBoxItemRenderer extends CheckBox{
		
		/**存储当前列数据对象**/
		private var currData:Object; 
		
		public function CheckBoxItemRenderer(){
			super();
			focusEnabled=false;
			this.addEventListener(Event.CHANGE,onClickCheckBox);
			this.addEventListener(MouseEvent.CLICK,onck);
		}
		private function onck(e:MouseEvent):void{
			//			Alert.show("ok");
		} 
		override public function set data(value:Object):void{
			super.data=value;
			if(value==null)return;
			this.selected = value.selected;
			this.currData = value; 
			this.label=value[((owner as ListBase).owner as ComboBox).labelField];
		}
		override public function set enabled(value:Boolean):void{
			if(currData){
				value=currData.enabled==false?false:true;
			}
			super.enabled=value;
		}
		override public function set selected(value:Boolean):void{
			super.selected=value;
		}
		private function onClickCheckBox(e:Event):void{	
			currData.selected = selected;
			(ListBase(listData.owner).owner as MultipleSelectComboBox).invalidateDisplayList();
			if(currData.id=="MyComboBoxSelectAllObject"){
				(ListBase(listData.owner).owner as MultipleSelectComboBox).selectAll(selected);
			}
		}
	}
}