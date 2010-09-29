package
{
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import plants.Plant;
	import plants.PlantFactory;
	
	import trees.Node;
	
	[SWF(width="800", height="600", frameRate="60", backgroundColor="#00ffff")]
	public class BiomoddFlash extends Sprite
	{
		private var motherNode:Node;
		
		private var backGround:Sprite;
		
		private var _plants:Sprite;
		
		public function BiomoddFlash()
		{
			backGround = new Sprite();
			backGround.graphics.beginFill(0x000000, 1);
			backGround.graphics.drawRect(0,0,800,600);
			backGround.graphics.endFill();
			backGround.x = 0;
			backGround.y = 0;
			addChild(backGround);
			
			_plants = new Sprite();
			_plants.x = 0;
			_plants.y = 0;
			addChild(_plants);
						
			var mother:Plant = PlantFactory.instance().getPlant(PlantFactory.BAMBOO);
			_plants.addChild(mother);
			motherNode = new Node(null, 10, 5, new Point(100,100), mother); 
			
			var timer:Timer = new Timer(100, int.MAX_VALUE);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(evt:TimerEvent):void{
			motherNode.simulateGrowth(1);			
			TweenMax.to(_plants, 1, {glowFilter:{color:0x91e600, alpha:1, blurX:30, blurY:30}});
		}
	}
}