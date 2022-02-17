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
    int hotbarAccessIndex = game.keyManager.lastNumKey;
    String toPlaceData = game.player.hotbar[hotbarAccessIndex];
    //String toPlaceClass = toPlaceData.substring(0, toPlaceData.indexOf('$'));
    //String toPlacePath = toPlaceData.substring(toPlaceData.indexOf('$') + 1, toPlaceData.length());
    game.spriteManager.spawn(game.spriteManager.APISprites, new API(x, y, 1, "north", toPlaceData));
  }
}


//--------------------


class SpriteManager {
  //arraylists for every category of sprite
  ArrayList<Sprite> objectSprites = new ArrayList<Sprite>(); // 0
  ArrayList<Sprite> functionSprites = new ArrayList<Sprite>(); // 1
  ArrayList<Sprite> APISprites = new ArrayList<Sprite>(); //2
  ArrayList<Sprite> variableSprites = new ArrayList<Sprite>(); // 3
  ArrayList<Sprite> entitySprites = new ArrayList<Sprite>(); // 4
  ArrayList<Sprite> UISprites = new ArrayList<Sprite>(); // 5
  
  //2d array containing all sprite array lists
  ArrayList<ArrayList<Sprite> > spritesList =  new ArrayList<ArrayList<Sprite> >();
  
  //que to delete sprites 
  ArrayList<Sprite> deleteQue = new ArrayList<Sprite>();
  
  //2d que containing arraylist to delete sprites from
  ArrayList<ArrayList<Sprite> > listDeleteFromQue =  new ArrayList<ArrayList<Sprite> >();
  
  SpriteManager(){
    spritesList.add(objectSprites);
    spritesList.add(functionSprites);
    spritesList.add(APISprites);
    spritesList.add(variableSprites);
    spritesList.add(entitySprites);
    spritesList.add(UISprites);
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
  
  void delete(ArrayList<Sprite> listDeleteFrom, Sprite toDelete){
    deleteQue.add(toDelete);
    listDeleteFromQue.add(listDeleteFrom);
  }
  
  void clearDelete(){
    for(int i = 0; i < deleteQue.size(); i++){
      listDeleteFromQue.get(i).remove(deleteQue.get(i));
    }
  }
}


//--------------------


class MouseManager {
  
}
