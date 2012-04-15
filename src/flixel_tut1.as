package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class flixel_tut1 extends FlxGame
	{
		public function flixel_tut1()
		{
			super(640,480,MenuState,1);
		}
	}
}

