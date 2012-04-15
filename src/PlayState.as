package
{
	import flash.display.ShaderInput;
	import org.flixel.*;
	import sprites.Alien;
	import sprites.Bullet;
	import sprites.Ship;

	public class PlayState extends FlxState
	{
		private var ship:Ship;
		private var aliens:FlxGroup;
		private var bullets:FlxGroup;
		private var spawn_timer:Number;
		private var spawn_interval:Number = 2.5;
		private var scoreText:FlxText;
		private var gameOverText:FlxText;
		
		[Embed(source="../assets/bullet2.mp3")]
		private var bulletSound:Class;
		[Embed(source = "../assets/explosion1.mp3")]
		private var alienExplodeSound:Class;
		[Embed(source = "../assets/explosion2.mp3")]
		private var shipExplodeSound:Class;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffabcc7d;

			//add(new FlxText(0, 0, 100, "INSERT GAME HERE"));
			ship = new Ship(50, 50);
			add(ship);
			
			aliens = new FlxGroup();
			add(aliens);
			
			bullets = new FlxGroup();
			add(bullets);
			
			scoreText = new FlxText(10, 8, 200, "0");
			scoreText.setFormat(null, 32, 0xff597137, "left");
			add(scoreText);
			
			reset_spawn_timer();
			
			super.create();
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("SPACE") && ship.alive)
				spawn_bullet(ship.getBulletSpawnPosition());
				
			if (FlxG.keys.ENTER && !ship.alive)
			{
				FlxG.score = 0;
				FlxG.switchState(new PlayState());
			}
			
			spawn_timer -= FlxG.elapsed;
			
			if (spawn_timer < 0)
			{
				spawn_alien();
				reset_spawn_timer();
			}
			
			super.update();
			
			FlxG.overlap(aliens, bullets, overlapAliensBullets);
			FlxG.overlap(aliens, ship, overlapAliensShip);
		}
		
		private function spawn_alien():void
		{
			aliens.add(new Alien(FlxG.width, Math.random() * (FlxG.height - 100) + 50));
		}
		
		private function reset_spawn_timer():void
		{
			spawn_timer = spawn_interval;
			spawn_interval = Math.max(spawn_interval * 0.95, 0.1);
		}
		
		private function spawn_bullet(p:FlxPoint):void
		{
			bullets.add(new Bullet(p.x, p.y));
			FlxG.play(bulletSound);
		}
		
		private function overlapAliensBullets(a:Alien, b:Bullet):void
		{
			a.kill();
			b.kill();
			FlxG.play(alienExplodeSound);
			FlxG.score += 1;
			scoreText.text = FlxG.score.toString();
		}
		private function overlapAliensShip(a:Alien, s:Ship):void
		{
			s.kill();
			a.kill();
			FlxG.play(shipExplodeSound);
			FlxG.shake(0.02);
			
			gameOverText = new FlxText(0, FlxG.height / 2, FlxG.width, "GAME OVER\nPRESS ENTER TO PLAY AGAIN");
			gameOverText.setFormat(null, 16, 0xff597137, "center");
			
			add(gameOverText);
		}
	}
}

