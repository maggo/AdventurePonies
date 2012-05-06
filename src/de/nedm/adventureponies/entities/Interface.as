package de.nedm.adventureponies.entities
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	public class Interface extends FlxGroup
	{
		public var score:FlxText;
		public var level:FlxText;
		
		public function Interface()
		{
			super();
			
			score = new FlxText(25, 10, 100, 'SCORE: 0000');
			score.alignment = "left";
			score.size = 8;
			
			level = new FlxText(FlxG.width - 25 - 80, 10, 80, "LEVEL: " + FlxG.level.toString());
			level.alignment = "right";
			level.size = 8;
			
			score.color = level.color = 0xFF000000;
			
			add(score);
			add(level);
		}
		
		override public function update():void
		{
			score.text = "SCORE: " + FlxG.score.toString();
			super.update();
		}
	}
}