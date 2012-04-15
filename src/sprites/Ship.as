package sprites 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author Eric Gerlach
	 */
	public class Ship extends FlxSprite 
	{
		[Embed(source = "../../assets/ship2.png")]
		private var image:Class;
		
		public function Ship(X:Number=0, Y:Number=0) 
		{
			super(X, Y, image);
		}
		
		override public function update():void
		{
			velocity = new FlxPoint(0, 0);
			
			if (FlxG.keys.LEFT)
				velocity.x = -250
			
			if (FlxG.keys.RIGHT)
				velocity.x = 250
			
			if (FlxG.keys.UP)
				velocity.y = -250
				
			if (FlxG.keys.DOWN)
				velocity.y = 250;
				
			super.update();
			
			x = FlxU.bound(x, 16, FlxG.width - width - 16);
			y = FlxU.bound(y, 16, FlxG.height - height - 16);
		}
		public function getBulletSpawnPosition():FlxPoint
		{
			return new FlxPoint(x + 36, y + 12);
		}
	}

}