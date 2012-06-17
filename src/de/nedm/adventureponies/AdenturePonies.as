package de.nedm.adventureponies
{
	import de.nedm.adventureponies.entities.PinkiePie;
	import de.nedm.adventureponies.worlds.ApplejackStage;
	import de.nedm.adventureponies.worlds.NextLevelState;
	import de.nedm.adventureponies.worlds.PinkiePieStage;
	import de.nedm.adventureponies.worlds.TitleState;
	
	import flash.display.Sprite;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	
	[SWF(width="860", height="480", frameRate="30")]
	public class AdenturePonies extends FlxGame
	{
		public function AdenturePonies()
		{
			super(860/4, 480/4, ApplejackStage, 4, 30, 30, true);
			trace(FlxG.width);
			FlxG.debug = true;
			//FlxG.visualDebug = true;
		}
	}
}