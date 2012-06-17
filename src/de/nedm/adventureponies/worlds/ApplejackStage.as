package de.nedm.adventureponies.worlds
{
	import de.nedm.adventureponies.Assets;
	import de.nedm.adventureponies.entities.Apple;
	import de.nedm.adventureponies.entities.Applejack;
	import de.nedm.adventureponies.entities.Dragon;
	import de.nedm.adventureponies.entities.Interface;
	
	import flash.display.InteractiveObject;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public class ApplejackStage extends FlxState
	{
		public var ground:FlxSprite;
		public var dragon:Dragon;
		
		public var ready:Boolean;
		
		public var bar:FlxSprite;
		public var strength:Number = 0;
		
		private var counter:Number;
		
		public var apples:FlxGroup;
		
		public function ApplejackStage()
		{
			super();
			
		}
		
		override public function create():void
		{
			super.create();
			
			FlxG.level = 2;
			
			ground = new FlxSprite(0, FlxG.height - 8);
			ground.visible = false;
			ground.immovable = true;
			ground.width = FlxG.width + 20;
			ground.height = 10;
			add(ground);
			
			add(new FlxSprite(0,0, Assets.AJBG));
			add(new Applejack());
			
			
			bar = new FlxSprite(60, 70);
			bar.loadGraphic(Assets.BAR);
			bar.visible = false;
			bar.height = 1;
			add(bar);
			
			add(new Interface());
			
			apples = new FlxGroup();
			apples.add(new Apple(151, 80));
			apples.add(new Apple(156, 81));
			apples.add(new Apple(162, 82));
			apples.add(new Apple(155, 84));
			apples.add(new Apple(158, 85));
			apples.add(new Apple(149, 86));
			apples.add(new Apple(161, 86));
			apples.add(new Apple(145, 87));
			apples.add(new Apple(154, 88));
			apples.add(new Apple(157, 89));
			apples.add(new Apple(163, 89));
			apples.add(new Apple(157, 89));
			apples.add(new Apple(148, 90));
			apples.add(new Apple(152, 93));
			apples.add(new Apple(160, 93));
			apples.add(new Apple(148, 95));
			apples.add(new Apple(155, 96));
			
			add(apples);
			
			add(dragon = new Dragon());
		}
		
		public function buck():void{
			
			var apple:Apple = apples.getRandom() as Apple;
			if(!apple.moves) apple.moves = true;
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(dragon, ground);
			
			if(ready){
				strength -= FlxG.elapsed * 5;
				
				if(FlxG.keys.justPressed('SPACE')){
					strength += 1;
				}
				
				bar.height = 19 / (10 / strength);
				bar.y = 89 - bar.height;
				
				if(strength < 0) strength = 0;
			}
			
			
		}
		
		public function enableFight():void{
			ready = true;
			
			bar.visible = true;
		}
	}
}