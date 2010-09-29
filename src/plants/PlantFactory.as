package plants
{
	public class PlantFactory
	{
		private static var _instance:PlantFactory;
		private static var allowInstantiation:Boolean;
		
		public static const BAMBOO:int = 0;
		public static const GENERIC:int = 1;
		
		public static function instance():PlantFactory{
			if(_instance==null){
				allowInstantiation = true;				
				_instance = new PlantFactory();
				allowInstantiation = false;
			}
			return _instance;
		}
		
		public function PlantFactory(){
			if(!allowInstantiation){
				throw new Error("Unable to instantiate singleton PlantFactory");
			}
		}
		
		public function getPlant(type:int):Plant{
			if(type == BAMBOO){
				return new Bamboo();
			}else{
				return new Plant();
			}
		}
	}
}