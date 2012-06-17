package de.nedm.adventureponies.entities
{
	import de.nedm.adventureponies.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Apple extends FlxSprite
	{
		private var endY:Number;
		
		public function Apple(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			
			endY = FlxG.height - 2 - Math.random() * 8;
			
			loadGraphic(Assets.APPLE);
			acceleration.y = 200;
			this.moves = false;
		}
		
		override public function update():void
		{
			super.update();

			if(y >= endY && moves){
				moves = false;
			}
		}
	}
}