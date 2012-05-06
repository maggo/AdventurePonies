package de.nedm.adventureponies.entities
{
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	
	public class Score extends FlxText
	{
		public function Score(X:Number, Y:Number, score:Number)
		{
			super(X, Y, 50, score.toString());
			
			this.color = 0xFFea53a1;
			
			this.flicker(-1);
			
			acceleration.y = -100;
		}
		
		override public function update():void
		{
			super.update();
			if(y <= -height){
				 FlxG.state.remove(this);
			}
		}
		
		
	}
}