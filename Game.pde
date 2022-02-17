import java.util.*;

class Game {
  //player
  Player player;
  
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
    player = new Player(width/2, height/2, 50, 50, 200);
    spriteManager.spawn(spriteManager.spritesList.get(4), game.player);
  }
}
