package de.nedm.adventureponies.entities
{
	import de.nedm.adventureponies.Assets;
	import de.nedm.adventureponies.worlds.ApplejackStage;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class Dragon extends FlxSprite
	{
		private var count:Number = 0;
		public function Dragon()
		{
			super(FlxG.width + 15, 60);
			loadGraphic(Assets.DRAGON, true, false, 32*2, 26*2);
			addAnimation('stand', [0], 0);
			addAnimation('tail', [0, 1, 2, 0], 4, false);
			this.addAnimationCallback(animDone);
			
			play('stand');
			
			velocity.x = -50;
			acceleration.y = 200;
		}
		
		private function animDone(animationName:String, currentFrame:uint, currentFrameIndex:uint):void{
			if(animationName == "tail" && currentFrame == 3){
				
				if(Math.random() > 0.5) (FlxG.state as ApplejackStage).buck();
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if(!immovable){
				if(x <= 90){
					immovable = true;
					x = 90;
					y = 60;
					play('tail');
					velocity = new FlxPoint();
					acceleration.y = 0;
					(FlxG.state as ApplejackStage).enableFight();
				} else if(isTouching(DOWN)){
					velocity.y -= 50;
				}
			}
			
			if(immovable){
				count += FlxG.elapsed;
				
				if(count > 2){
					count -= 2;
					play('tail');
				}
			}
		}
		
		
	}
}