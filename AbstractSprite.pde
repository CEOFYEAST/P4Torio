abstract class AbstractSprite implements Sprite {
  int x, y, w, h, size, sizeMultiplier = 50; //sizeMultiplier is an ass name 
  String direction = "north", path;
  PImage sprite;
  color col;
  
  AbstractSprite() { }
  AbstractSprite(int x, int y, int w, int h, color col) {
    this.x = x; this.y = y;
    this.size = size;
    this.w = w; this.h = h;
    this.col = col;
  }
  AbstractSprite(int x, int y, int w, int h, String path) {
    this.x = x; this.y = y;
    this.size = size;
    this.w = w; this.h = h;
    this.path = path;
    
    sprite = loadImage(path);
    sprite.resize(w, h);
  }
  AbstractSprite(int x, int y, int size, String path) {
    this.x = x; this.y = y;
    this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.path = path;
    
    sprite = loadImage(path);
    sprite.resize(w, h);
  }
  AbstractSprite(int x, int y, int size, String direction, String path) {
    this.x = x; this.y = y;
    this.direction = direction; this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.path = path;
    
    sprite = loadImage(path);
    sprite.resize(w, h);
  }
  AbstractSprite(int x, int y,int size, color col){
    this.x = x; this.y = y;
    this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.col = col;
  }
  
  
  void move(){
    
  }
  
  void render(){
    if(path != null){
      push();
      imageMode(CENTER);
      
      //image sprite with direction
      if(direction != null){
        push();
          translate(x, y);
          switch(direction){
            case "east":
              rotate(radians(90));
              break;
            case "south":
              rotate(radians(180));
              break;
            case "west":
              rotate(radians(260));
              break;
          }
          image(sprite, 0, 0);
        pop();
      } 
      
      else {
        //image sprite with no direction
        image(sprite, x-(w/2),y-(h/2));
      }
      pop();
    } 
    
    else {
      //room for future non-image sprites
    }
  }
  
   //boolean collide(Sprite spr){
   // boolean sprInTL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
   // boolean sprInTR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
   // boolean sprInBL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()-spr.getH()/2 < y+h/2); 
   // boolean sprInBR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()-spr.getH()/2 < y+h/2);
    
   // return sprInTL && sprInTR && sprInBL && sprInBR;
   //}
}
