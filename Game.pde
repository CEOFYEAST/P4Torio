import java.util.*;

//arraylists for every category of sprite
ArrayList<Sprite> itemSprites = new ArrayList<Sprite>();
ArrayList<Sprite> machineSprites = new ArrayList<Sprite>();

//que to delete sprites (duh)
ArrayList<Sprite> deleteQue = new ArrayList<Sprite>();

class Game {
  void play(){
    background(255);
    
    for(Sprite s: machineSprites){
      s.move();
      s.render();
    }
    for(Sprite s: itemSprites){
      s.move();
      s.render();
    }
    
    clearDelete();
  }
  
  void config() {
    noStroke();
    rectMode(CENTER);
  }
  
  void spawn(ArrayList<Sprite> addTo, Sprite toAdd){
    addTo.add(toAdd);
  }
  
  void delete(Sprite toDelete){
    deleteQue.add(toDelete);
  }
  
  void clearDelete(){
    for(Sprite s: deleteQue){
      itemSprites.remove(s);
      machineSprites.remove(s);
    }
    deleteQue.clear();
  }
  
  void load(){
    config();
    spawn(machineSprites, new Machine(height/2, width/2, 1, "south", "assets/belt-yellow.jpg"));
  }
}
