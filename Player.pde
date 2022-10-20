class Player extends AbstractSprite {
  Hotbar hotbar;
  int speed = 10;
  
  Player(int x, int y, int w, int h, color col) {
    super(x, y, w, h, col);
    hotbar = new Hotbar();
  }
  
  void move(){
    if(game.keyManager.moveKeys[0]){
        y -= speed;
    }
    if(game.keyManager.moveKeys[1]){
        x -= speed;
    }
    if(game.keyManager.moveKeys[2]){
        y += speed;
    }
    if(game.keyManager.moveKeys[3]){
        x += speed;
    }
  }
   
  void render(){
    //player
    push();
    fill(col);
    ellipse(x, y, 50, 50);
    pop();
  }
}
