package sprites 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Eric Gerlach
	 */
	public class Alien extends FlxSprite 
	{
		[Embed(source = "../../assets/Alien.png")]
		private var image:Class;
		
		public function Alien(x:Number, y:Number):void
		{
			super(x, y, image);
			velocity.x = -200;
		}
		
		override public function update():void
		{
			velocity.y = Math.cos(x / 50) * 50;
			super.update();
		}
		
	}

}