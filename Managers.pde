class KeyManager {
  boolean[] moveKeys = new boolean[4];
  boolean[] numKeys = new boolean[10];
  
  int lastNumKey = 0;
  
  KeyManager(){
    Arrays.fill(moveKeys, false);
    Arrays.fill(numKeys, false);
  }
  
  void setKeys(char k, int kc, boolean b) {
      switch (k) {
        //main movement keys
        case 'w': case 'W':
          moveKeys[0] = b;
          break;
        case 'a': case 'A':
          moveKeys[1] = b;
          break;
        case 's': case 'S':
          moveKeys[2] = b;
          break;
        case 'd': case 'D':
          moveKeys[3] = b;
          break;   
          
        //num keys
        case '0': case '1': case '2': case '3': case '4': case '5': case '6': case '7': case '8': case '9': 
          //updates last key pressed and the number keys boolean array
          int currentValue = k - '0';
          numKeys[currentValue] = b;
          if(b){
            lastNumKey = currentValue;
          }
          break;
      }
      
      //handles keycodes
      switch (kc){
        
    }
  }
}


//--------------------


class PlaneManager {
  void place(int x, int y){
    String toPlacePath = game.player.hotbar[game.keyManager.lastNumKey];
    print(toPlacePath);
    //game.spriteHandler.spawn(new 
  }
}


//--------------------


class SpriteManager {
  //2d array containing all arrays of sprites
  ArrayList<ArrayList<Sprite> > spritesList =  new ArrayList<ArrayList<Sprite> >() {
    //arraylists for every category of sprite
    ArrayList<Sprite> objectSprites = new ArrayList<Sprite>();
    ArrayList<Sprite> functionSprites = new ArrayList<Sprite>();
    ArrayList<Sprite> APISprites = new ArrayList<Sprite>();
    ArrayList<Sprite> variableSprites = new ArrayList<Sprite>();
    ArrayList<Sprite> UISprites = new ArrayList<Sprite>();
  };
  
  //que to delete sprites (duh)
  ArrayList<Sprite> deleteQue = new ArrayList<Sprite>();
  
  SpriteManager(){
    //spritesList.add(objectSprites);
    //spritesList.add(functionSprites);
    //spritesList.add(APISprites);
    //spritesList.add(variableSprites);
  }
  
  void updateSprites(){
    //executes the move and render methods of every sprite in every list
    //those lists coming first in the spritesList recieve priority 
    for(ArrayList<Sprite> currentList: spritesList){
      for(Sprite currentSprite: currentList){
        currentSprite.move();
        currentSprite.render();
      }
    }
      
    clearDelete();
  }
  
  void spawn(ArrayList<Sprite> addTo, Sprite toAdd){
    //adds sprite to specific sprite array
    addTo.add(toAdd);
  }
  
  void delete(Sprite toDelete){
    deleteQue.add(toDelete);
  }
  
  void clearDelete(){
    //goes through every sprite list attempting to remove the sprite to be deleted from it 
    for(ArrayList<Sprite> currentList: spritesList){
      for(Sprite currentSprite: currentList){
        try{
          currentList.remove(currentSprite);
        } catch(NullPointerException e){
          continue;
        }
      }
    }
   
    deleteQue.clear();
  }
}


//--------------------


class MouseManager {
  
}
