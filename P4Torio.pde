Game game = new Game();
boolean paused = false; 

void setup() {
  size(800, 800);
  game.load();
}

void draw() {
  game.play();
}

void keyPressed() {
}
void keyReleased() {
}
