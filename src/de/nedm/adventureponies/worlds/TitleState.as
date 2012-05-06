package de.nedm.adventureponies.worlds
{
	import de.nedm.adventureponies.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public class TitleState extends FlxState
	{
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xFFF7D2E6;
			var logo:FlxSprite = new FlxSprite();
			logo.loadGraphic(Assets.LOGO, true, false, 58*2, 38*2);
			logo.addAnimation('blink', [0,1], 3);
			logo.play('blink');
			//logo.scale = new FlxPoint(1.5, 1.5);
			logo.x = FlxG.width / 2 - logo.width / 2;
			logo.y = 20;
			add(logo);
		}
		
		override public function update():void
		{
			super.update();
			
			if(FlxG.mouse.pressed() || FlxG.keys.any()){
				FlxG.switchState(new PinkiePieStage());
			}
		}
		
		
	}
}