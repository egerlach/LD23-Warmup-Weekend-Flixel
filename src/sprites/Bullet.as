package sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Eric Gerlach
	 */
	public class Bullet extends FlxSprite 
	{
		
		public function Bullet(x:Number, y:Number) 
		{
			super(x, y);
			makeGraphic(16, 4, 0xff597137);
			velocity.x = 1000;
			
		}
	}

}