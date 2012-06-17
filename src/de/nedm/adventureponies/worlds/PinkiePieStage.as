package de.nedm.adventureponies.worlds
{
	import de.nedm.adventureponies.Assets;
	import de.nedm.adventureponies.entities.Cloud;
	import de.nedm.adventureponies.entities.Interface;
	import de.nedm.adventureponies.entities.PinkiePie;
	import de.nedm.adventureponies.entities.Player;
	import de.nedm.adventureponies.entities.Score;
	
	import flash.text.engine.FontPosture;
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public class PinkiePieStage extends FlxState
	{
		public var ground:FlxGroup;
		public var player:Player;
		public var clouds:FlxGroup;
		
		public function PinkiePieStage()
		{
			super();
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xFFd0ecfd;
			FlxG.level = 1;
			
			add(new FlxSprite(0,0,Assets.PPBG));
			
			
			
			ground = new FlxGroup();
			
			var bottom:FlxSprite = new FlxSprite(0, FlxG.height - 10);
			bottom.width = FlxG.width + 100;
			bottom.height = 10;
			bottom.immovable = true;
			bottom.visible = false;
			ground.add(bottom);
			
			bottom = new FlxSprite(-10, 0);
			bottom.visible = false;
			bottom.immovable = true;
			bottom.width = 10;
			bottom.height = FlxG.height;
			ground.add(bottom);
			
			add(ground);
			
			var grass:FlxSprite = new FlxSprite(0, FlxG.height - 9);
			grass.makeGraphic(FlxG.width, 9, 0xFF96e198);
			add(grass);
			
			add(new FlxSprite(20, 91, Assets.HOUSES));
			
			add(new Interface());
			
			player = new PinkiePie();
			add(player);
			
			clouds = new FlxGroup();
			for(var i:int = 0; i <= 2; i++){
				clouds.add(new Cloud(25 + i * 62, 40));
			}
			
			add(clouds);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, ground);
			FlxG.collide(player, clouds, function(player:FlxObject, cloud:FlxObject):void{
				if(cloud.isTouching(FlxObject.DOWN)){
					if(cloud.alive){
						FlxG.score += 1000;
						add(new Score(cloud.x, cloud.y, 1000));
					}
					(cloud as Cloud).doStuff();
				}
			});
			
			if(player.x >= FlxG.width){
				FlxG.switchState(new NextLevelState());
			}
			
		}
		
	}
}