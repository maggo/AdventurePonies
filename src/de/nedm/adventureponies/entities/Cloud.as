package de.nedm.adventureponies.entities
{
	import de.nedm.adventureponies.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Cloud extends FlxSprite
	{
		private var count:Number = 0;
		private var wasHit:Boolean = false;
		public function Cloud(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			loadGraphic(Assets.CLOUD, true, false, 38, 20);
			immovable = true;
			addAnimation('normal', [0], 0);
			addAnimation('done', [1], 0);
			
			play('normal');
		}
		
		public function doStuff():void{
			play('done');
			alive = false;
			wasHit = true;
			y -= 5;
		}
		
		override public function update():void
		{
			super.update();
			
			if(!alive && wasHit){
				count += FlxG.elapsed;
				if(count >= 0.08){
					wasHit = false;
					count = 0;
					y = 40;
				}
			}
		}
		
		
	}
}