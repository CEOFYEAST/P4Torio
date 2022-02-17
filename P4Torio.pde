Game game = new Game();
boolean paused = false; 

void setup() {
  size(800, 800);
  game.load();
}

void draw() {
  game.play();
}

void mouseClicked(){
  game.planeManager.place(mouseX, mouseY);
}
void keyPressed() {
  game.keyManager.setKeys(key, keyCode, true);
}
void keyReleased() {
  game.keyManager.setKeys(key, keyCode, false);
}
