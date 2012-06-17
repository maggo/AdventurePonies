package de.nedm.adventureponies.worlds
{
	import de.nedm.adventureponies.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
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
			
			text = new FlxText(FlxG.width / 2 - 25, FlxG.height / 2 + 4, 50, 'LEVEL: 2');
			text.alignment = "center";
			
			add(text);
			
			var bg:FlxSprite = new FlxSprite(0,0);
			bg.loadGraphic(Assets.LEVELTWO, true, false, 215, 120);
			bg.addAnimation('blink', [0,1,2,3], 6);
			bg.play('blink');
			add(bg);
		}
		
		override public function update():void
		{
			super.update();
		
			if(FlxG.mouse.pressed() || FlxG.keys.any()){
				switch(FlxG.level++){
					case 2:
						FlxG.switchState(new ApplejackStage());
						break;
					case 3:
						// RD Stage
						break;
					case 4:
						// Discord
						break;
					default:
						break;
				}
			}
		}
		
		
	}
}