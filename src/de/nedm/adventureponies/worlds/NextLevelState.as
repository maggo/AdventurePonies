package de.nedm.adventureponies.worlds
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class NextLevelState extends FlxState
	{
		public var text:FlxText;
		public var count:Number = 0;
		
		public function NextLevelState()
		{
			super();
			
		}
		
		override public function create():void
		{
			super.create();
			
			FlxG.bgColor = 0xFFF7D2E6;
			
			text = new FlxText(FlxG.width / 2, FlxG.height / 2 + 10, 100, 'LEVEL: 2');
			text.alignment = "center";
			
			add(text);
		}
		
		override public function update():void
		{
			super.update();
		
			count += FlxG.elapsed;
			
			if(count >= 0.3){
				count -= 0.3;
				text.color = text.color == 0xFF000000 ? 0xFFFFFFFF : 0xFF000000;
			}
		}
		
		
	}
}