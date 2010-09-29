package plants
{
	public class Bamboo extends Plant
	{
		public function Bamboo()
		{
			draw();
		}
		
		override public function draw():void{
			graphics.beginFill(0x00FF00);
			graphics.drawRect(0,0,4,10);
			graphics.endFill();
		}
	}
}