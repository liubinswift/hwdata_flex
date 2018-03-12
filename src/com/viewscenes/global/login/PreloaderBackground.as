package com.viewscenes.global.login
{
	import flash.display.Loader;
	import flash.utils.ByteArray;
	
	public class PreloaderBackground extends Loader
	{
		[Embed(source="com/viewscenes/images/default/global2/index_bg.jpg", mimeType="application/octet-stream")]
		public var WelcomeBackground:Class;
		
		public function PreloaderBackground()
		{
			this.loadBytes(new WelcomeBackground() as ByteArray);
		}
	}

}