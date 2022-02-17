class Player extends AbstractSprite {
  //hotbar containing paths of items
  //String[] hotbar = new String[]{"API$assets/belt-yellow.jpg", "", "", "", "", "", "", "", "", ""};
  String[] hotbar = new String[]{"assets/belt-yellow.jpg", "", "", "", "", "", "", "", "", ""};
  
  int speed = 3;
  
  Player(int x, int y, int w, int h, color col) {
    super(x, y, w, h, col);
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
