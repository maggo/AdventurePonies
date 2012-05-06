package de.nedm.adventureponies.entities
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.system.input.Keyboard;
	
	public class Player extends FlxSprite
	{
		public function Player(x:Number=0, y:Number=0, SimpleGraphic:Class=null)
		{
			super(x, y, SimpleGraphic);
			
			var runSpeed:uint = 80;
			drag.x = runSpeed*8;
			acceleration.y = 420;
			maxVelocity.x = runSpeed;
			maxVelocity.y = 200;
		}
		
		override public function update():void{
			
			
			super.update();
		}
	}
}