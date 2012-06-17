package de.nedm.adventureponies.entities
{
	import de.nedm.adventureponies.Assets;
	
	import org.flixel.FlxSprite;
	
	public class Applejack extends FlxSprite
	{
		public function Applejack()
		{
			super(70, 90);
			loadGraphic(Assets.PONIES_BASIC, true, true, 22, 20);
			addAnimation('stand', [0]);
			play('stand');
		}
	}
}