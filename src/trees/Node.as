package trees
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import plants.Plant;
	import plants.PlantFactory;

	public class Node
	{
		public var parent:Node;
		public var graphic:Plant;
		
		private var _bearedFruit:Boolean;
		
		private var _lifeFactor:int; //Maximum Life of this node
		private var _groundFactor:int; //How fertile the ground is
		
		private var _location:Point;
		
		private var _life:int;
		private var _children:Vector.<Node>;
		
		public function Node(parent:Node, lifeFactor:int, groundFactor:int, location:Point, graphic:Plant ){
			this.parent = parent;
			
			_lifeFactor = lifeFactor;
			_groundFactor = groundFactor;
			_location = location;
			
			_bearedFruit = false;
			
			_children = new Vector.<Node>();
			_life = 0;
			
			this.graphic = graphic;
			if(parent){
				graphic.x = parent.location.x;
				graphic.y = parent.location.y;
				TweenLite.to(graphic, 1, {x:location.x, y:location.y});
			}else{
				graphic.x = location.x;
				graphic.y = location.y;
				graphic.alpha = 0;
			}	
		}
		
		public function get location():Point{
			return _location;
		}
		
		public function simulateGrowth(growForce:int):void{
			if(_life >= _lifeFactor){
				if(!_bearedFruit){
					
					bearChild(growForce);
					_bearedFruit = true;
				}
				_life = 0;
				
			}else{
				grow(growForce);
				growChildren(growForce);
			}
		}
		
		private function grow(growForce:int):void{
			_life+=growForce;
			var nuAlpha:Number = _life/_lifeFactor;		
						
		}
		
		private function growChildren(growForce:int):void{
			for each(var elem:Node in _children){
				elem.simulateGrowth(growForce);
			}
		}
		
		private function bearChild(growForce:int):void{
			//var parentLoc:Point = parent.location;
			var parentLoc:Point = _location;
			for(var i:int = 0; i < Math.random()*2; i++){
				var plant:Plant = PlantFactory.instance().getPlant(PlantFactory.BAMBOO);
				graphic.parent.addChild(plant);
				var xPos:int = Math.random()*20;
				var yPos:int = Math.random()*20;
				
				var child:Node = new Node(this, 10, 5, new Point(parentLoc.x+xPos,parentLoc.y+yPos), plant);
				_children.push(child);
			}
			
		}
	}
}