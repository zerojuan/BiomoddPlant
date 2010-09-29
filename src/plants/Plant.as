package plants
{
	import flash.display.Sprite;

	public class Plant extends Sprite
	{
		public function Plant()
		{
			draw();
		}
		
		public function draw():void{
			graphics.beginFill(0x00FF00);
			graphics.drawCircle(0,0,5);
			graphics.endFill();
		}
	}
}