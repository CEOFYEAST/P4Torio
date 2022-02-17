class API extends AbstractSprite {
   API(int x, int y, int size, String direction, String path){
    super(x, y, size, direction, path);
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
}


//--------------------


class Object extends AbstractSprite {
  Object(int x, int y, int size, String path){
    super(x, y, size, path);
  }
  Object(int x, int y, int w, int h, String path){
    super(x, y, w, h, path);
  }
}


//--------------------


class Variable extends AbstractSprite {
  Variable(int x, int y, int w, int h, String path){
    super(x, y, w, h, path);
  }
  
  void move(){
    
  }
}
