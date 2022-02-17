import java.util.*;

class Game {
  //player
  Player player = new Player(width/2, height/2, 50, 50, 200);
  
  //managers
  SpriteManager spriteManager = new SpriteManager();
  PlaneManager planeManager = new PlaneManager();
  KeyManager keyManager = new KeyManager();
  
  void play(){
    background(255);
    spriteManager.updateSprites();
  }
  
  void config() {
    noStroke();
    rectMode(CENTER);
  }
  
  void load(){
    config();
  }
}
