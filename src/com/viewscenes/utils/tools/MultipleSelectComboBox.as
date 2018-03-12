package com.viewscenes.utils.tools
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.system.System;
	
	import mx.collections.ArrayCollection;
	import mx.controls.ComboBox;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	import mx.events.ListEvent;
	import mx.utils.ArrayUtil;
	import mx.controls.Alert;
	[Event(name="myChange",type="flash.events.Event")]
	public class MultipleSelectComboBox extends ComboBox{
		private static var copyText:String;
		private static var copyType:String;
		public var type:String="";
		public var MySelectItems:ArrayCollection=new ArrayCollection;
		private var mouseOut:Boolean=true;
		private var promptText:String=null;
		public var textMode:String="count"//"count"/"value";
		public var sep:String=","//"count"/"value";分隔符
		public function MultipleSelectComboBox(){
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE,onCreateCompleteHandle);
			itemRenderer=new ClassFactory(CheckBoxItemRenderer);
			labelField="label";
			this.setStyle("closeDuration",0);
			this.setStyle("openDuration",0);
			this.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			this.toolTip="本组件支持使用Ctrl-C/Ctrl-V相互拷贝已选项.\n并可将已选项拷贝到其它文本编辑器中.";
		}
		private function onKeyUp(e:KeyboardEvent):void{
			if(e.charCode==99){
				//if(!e.ctrlKey)return;
				copyText=this.myText;
				System.setClipboard(copyText);
//				copyType=this.type;
			}else if(e.charCode==118){
				//if(!e.ctrlKey)return;
				if(copyText==null)return;
//				if((!copyType)||(copyType!=this.type)){
//					return;
//				}
				myText=copyText;
			}
		}
		public function set myText(value:String):void{
			var arr:Array=value.split(this.sep);
			for(var i:int=0;i<super.dataProvider.length;i++){
				if(value!=""&&value.indexOf(super.dataProvider[i][labelField].toString())!=-1){
					if(ArrayUtil.getItemIndex(super.dataProvider[i][labelField].toString(),arr)!=-1){
						super.dataProvider[i].selected=true;
					}
				}else{
					super.dataProvider[i].selected=false;
				}
			}
			super.text=value;
			invalidateDisplayList();
		} 
		public function get myText():String{
			if(this.text==this.promptText){
				return "";
			}
			return super.text;
		}
		private var _showAll:Boolean=false;
		private var allObj:Object={label:"全部",selected:false,id:"MyComboBoxSelectAllObject"};
		
		public function get isAllSelect():Boolean{
			return this.getActLength()==this.MySelectItems.length;
		}
		public function set showAll(b:Boolean):void{
			_showAll=b;
			if(b)addshowall();
		}
		private function get showAll():Boolean{
			return _showAll;
		}
		private function addshowall():void{
			if(!dataProvider)return;
			if((dataProvider as ArrayCollection).contains(allObj)){
				(dataProvider as ArrayCollection).removeItemAt((dataProvider as ArrayCollection).getItemIndex(allObj));
			}
			allObj[labelField]="全部";
			if(dataProvider is Array){
				dataProvider=new ArrayCollection((new Array(allObj)).concat(dataProvider));
			}else if(dataProvider is ArrayCollection){
				(dataProvider as ArrayCollection).addItemAt(allObj,0);
			}
		}
		override public function set labelField(value:String):void{
			super.labelField=value;
			allObj[value]="全部";
		}
		override public function set dataProvider(value:Object):void{
			super.dataProvider=value;
			if(_showAll)addshowall();
		}
		private function onCreateCompleteHandle(event:FlexEvent):void{
			this.addEventListener(ListEvent.ITEM_ROLL_OVER,onItemRollOverHandle);
			this.invalidateDisplayList();
		}
		private function initListener():void{
			if(dropdown){
				dropdown.allowMultipleSelection=false;
				dropdown.selectable=false;
				dropdown.verticalScrollPolicy="on";
				if(!dropdown.hasEventListener(MouseEvent.ROLL_OVER))
					dropdown.addEventListener(MouseEvent.ROLL_OVER,onRollOverHandle,false,0,true);
				if(!dropdown.hasEventListener(MouseEvent.ROLL_OUT))
					dropdown.addEventListener(MouseEvent.ROLL_OUT,onRollOutHandle,false,0,true);
				dropdown.invalidateList();
			}
			selectedIndex=-1;
		}
		private function onRollOverHandle(event:MouseEvent):void{
			mouseOut=false;
		}
		private function onItemRollOverHandle(event:ListEvent):void{
			mouseOut=false;
			initListener();
		}
		private var changeEvent:ListEvent;
		private function onRollOutHandle(event:MouseEvent):void{
			mouseOut=true;
			if(selectedItems.length>0||MySelectItems.length>0){
				close();
			}
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			if(!dataProvider)return;
			MySelectItems.removeAll();
			for each(var obj:Object in dataProvider){
				if(obj.selected&&obj.id!="MyComboBoxSelectAllObject")this.MySelectItems.addItem(obj);
			}
			textInput.text="";
			if(textMode=="count"){
				var str:String="";
				if(MySelectItems.length==1){
				str=MySelectItems[0][labelField];
				}else if(MySelectItems.length==getActLength()){
					str="全部";
				}else{
					str="已选"+MySelectItems.length+"/"+(getActLength())+"项";
				}
				text=str;
			}else{
//				for each(var obj:Object in MySelectItems){
//					textInput.text+=(obj[labelField]+sep);
//				}
				var str:String="";
				for(var i:int=0;i<MySelectItems.length;i++){
					str+=MySelectItems[i]["value"];
					if(i!=MySelectItems.length-1){
						str+=sep;
					}
				}
//				textInput.text=str;
				text=str;
			}
			if(MySelectItems.length==0){
				text=this.promptText;
			}
			
			allObj.selected=MySelectItems.length==getActLength();
			initListener();
		}
		private function getActLength():int{
			return _showAll?dataProvider.length-1:dataProvider.length;
		}
		/*@*/
		public function set selectedItems(value:Array):void{
			if (dropdown)
				dropdown.selectedItems=value;
		}
		/*@*/
		[Bindable("change")]
		public function get selectedItems():Array{
			return dropdown?dropdown.selectedItems:[];
		}
		/*@*/
		public function set selectedIndices(value:Array):void{
			if (dropdown)
				dropdown.selectedIndices=value;
		}
		/*@*/
		[Bindable("change")]
		public function get selectedIndices():Array{
			return dropdown?dropdown.selectedIndices:[];
		}
		override public function close(trigger:Event=null):void{
//			initListener();
			if (mouseOut){
				super.close(trigger);
				dispatchEvent(new Event("myChange",true));
			}
		}
		/*@*/
		override public function set prompt(value:String):void{
			promptText=value;
		}
		public function altSelect():void{
			for each(var obj:Object in dataProvider){
				if(obj.selected==true){
					obj.selected=false;
				}else{
					obj.selected=true;
				}
			}
			dropdown.invalidateList();
			invalidateDisplayList();
			
		}
		public function selectAll(b:Boolean):void{
			for each(var obj:Object in dataProvider){
				obj.selected=b;
			}
			dropdown.invalidateList();
			invalidateDisplayList();
		}
	}
}