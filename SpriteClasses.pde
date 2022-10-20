class API extends AbstractSprite {
  API(){}
  API(int x, int y, int size, String direction, String path){
    super(x, y, size, direction, path);
  }
  API(int x, int y, int size, String direction, String path, int tint){
    super(x, y, size, direction, path, tint);
  }
  API(API other){
    //super(other.x, other.y, other.size, other.direction, other.path, other.tint);
    super(other);
  }
}
//class YellowBelt extends API {
//  YellowBelt(int x, int y, String direction){
//    super(x, y, 1, direction, "assets/belt-yellow.jpg");
//  }
//}


//--------------------


class Function extends AbstractSprite {
  Function(int x, int y, int size, String path){
    super(x, y, size, path);
  }
  Function(int x, int y, int size, String direction, String path){
    super(x, y, size, direction, path);
  }
  
  Function(Function other){
    super(other);
  }
}


//--------------------


class Obstacle extends AbstractSprite {
  Obstacle(int x, int y, int size, String path){
    super(x, y, size, path);
  }
  Obstacle(int x, int y, int w, int h, String path){
    super(x, y, w, h, path);
  }
  
  Obstacle(Obstacle other){
    super(other);
  }
}


//--------------------


class Variable extends AbstractSprite {
  Variable(int x, int y, int w, int h, String path){
    super(x, y, w, h, path);
  }
  
  Variable(Variable other){
    super(other);
  }
  
  void move(){
    
  }
}
