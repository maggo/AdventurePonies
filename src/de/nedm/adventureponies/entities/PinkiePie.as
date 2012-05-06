package de.nedm.adventureponies.entities
{
	import de.nedm.adventureponies.Assets;
	
	import org.flixel.FlxG;
	
	public class PinkiePie extends Player
	{
		private var count:Number = 0;
		private var preparing:Boolean = false;
		
		public function PinkiePie()
		{
			super(10, 80);
			
			width = 22;
			height = 20;
			
			loadGraphic(Assets.PONIES_BASIC, true, true, 22, 20);
			addAnimation('stand', [9], 0);
			addAnimation('jump', [9], 0);
			addAnimation('falling', [10], 0);
			addAnimation('preparing', [11], 0);
			
			this.play('stand');
		}
		
		override public function update():void
		{
			super.update();
			
			acceleration.x = 0;
			
			if(FlxG.keys.LEFT){
				facing = LEFT;
				acceleration.x = -drag.x;
			}
			
			if(FlxG.keys.RIGHT){
				facing = RIGHT;
				acceleration.x = drag.x;
			}
			
			if(isTouching(DOWN)){
				count += FlxG.elapsed;
				var prepareTime:Number = 0.4;
				if(count >= prepareTime){
					count -= prepareTime;
					play('jump');
					preparing = false;
					velocity.y = FlxG.keys.UP ? -200 : -100;
				} else {
					play('preparing');
					preparing = true;
					acceleration.x = 0;
					velocity.x = 0;
				}
			}	
			
			if(velocity.y > 0){
				if(acceleration.x == 0)
					play('stand', true);
				else
					play('falling', true);
			} else if(velocity.y < 0)
				play('jump', true);
		}
		
		
	}
}