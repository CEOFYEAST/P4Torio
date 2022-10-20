abstract class AbstractSprite {
  int x, y, w, h, size, sizeMultiplier = 50; //sizeMultiplier is an ass name 
  String direction = "north", path;
  PImage sprite;
  color col, tint;
  
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
    
    load();
  }
  AbstractSprite(int x, int y, int size, String path) {
    this.x = x; this.y = y;
    this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.path = path;
    
    load();
  }
  AbstractSprite(int x, int y, int size, String direction, String path) {
    this.x = x; this.y = y;
    this.direction = direction; this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.path = path;
    
    load();
  }
  AbstractSprite(int x, int y, int size, String direction, String path, int tint) {
    this.x = x; this.y = y;
    this.direction = direction; this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.path = path;
    this.tint = tint;
     
    load();
  }
  AbstractSprite(int x, int y,int size, color col){
    this.x = x; this.y = y;
    this.size = size;
    this.w = size *  sizeMultiplier;
    this.h = size * sizeMultiplier;
    this.col = col;
  }
  
  //copy constructor 
  AbstractSprite(AbstractSprite other){
    this.x = other.x; this.y = other.y; 
    this.w = other.w; this.h = other.h; 
    this.size = other.size;
    this.direction = other.direction; this.path = other.path;
    this.sprite = other.sprite;
    this.col = other.col; this.tint = other.tint;
    
    //load();
  }
  
  int getX(){ return x; }
  void setX(int x){ this.x = x; }
  int getY(){ return y; }
  void setY(int y) { this.y = y; }
  
  void move(){
  }
  
  void render(){
    try{
    if(path != null){
      //push();
      imageMode(CENTER);
      
      //image sprite with direction
      if(direction != null){
        //push();
        print(x);
          translate(x, y);
          switch(direction){
            case "east":
              rotate(radians(90));
              break;
            case "south":
              rotate(radians(180));
              break;
            case "west":
              rotate(radians(270));
              break;
          }
          image(sprite, 0, 0);
        //pop();
      } 
      
      else {
        //image sprite with no direction
        image(sprite, x-(w/2),y-(h/2));
      }
      //pop();
    } 
    
    else {
      //room for future non-image sprites
    }
    } catch(Exception e){
     e.printStackTrace(System.out);
    }
  }
  
  void load(){
    try{
      sprite = loadImage(path);
      sprite.resize(w, h);
    } catch(Exception e){
      e.printStackTrace(System.out);
    }
    //print(toString());
  }
  
  void colorImage(color tint){
    this.tint = tint;
    load();
  }
  
   //boolean collide(Sprite spr){
   // boolean sprInTL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
   // boolean sprInTR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
   // boolean sprInBL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()-spr.getH()/2 < y+h/2); 
   // boolean sprInBR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()-spr.getH()/2 < y+h/2);
    
   // return sprInTL && sprInTR && sprInBL && sprInBR;
   //}
   
   String toString(){
     return 
     "Name: " + path.substring(path.indexOf("/") + 1, path.indexOf(".")) + "\n" +
     "Ints: x/" + x + "y/ " + y + " w/" + w + " h/" + h + " size/" + size + " sizeMultiplier/" + sizeMultiplier + "\n" + 
     "Strings: direction/" + direction + " path/" + path + "\n" +
     "PImage: sprite/" + sprite + "\n" +
     "color: col" + col + " tint" + tint + "\n";   
   }
}
