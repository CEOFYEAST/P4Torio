class KeyManager {
  boolean[] moveKeys = new boolean[4];
  boolean[] numKeys = new boolean[10];
  
  int lastNumKey = 1;
  
  KeyManager(){
    Arrays.fill(moveKeys, false);
    Arrays.fill(numKeys, false);
  }
  
  void setKeys(char k, int kc, boolean isDown) {
      switch (k) {
        //main movement keys
        case 'w': case 'W':
          moveKeys[0] = isDown;
          break;
        case 'a': case 'A':
          moveKeys[1] = isDown;
          break;
        case 's': case 'S':
          moveKeys[2] = isDown;
          break;
        case 'd': case 'D':
          moveKeys[3] = isDown;
          break;   
          
        //num keys
        case '0': case '1': case '2': case '3': case '4': case '5': case '6': case '7': case '8': case '9': 
          //updates last key pressed and the number keys boolean array
          int currentValue = k - '0';
          numKeys[currentValue] = isDown;
          if(isDown){
            lastNumKey = currentValue;
          }
          break;
        
        //misc keys
          //debug
        case '`': case '~':
          print(game.player.x + " ");
          print(game.player.y + "\n");
          break;
        case 'r': case 'R':
          if(isDown != true){
            game.planeManager.rotate();
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
  String currentDirection = "north";
  int planeSize = 16; //planeSize x planeSize
  //2d-array containing abstractSprites that represents the tiled map
  AbstractSprite[][] plane = new AbstractSprite[planeSize][planeSize];
  
  //replicates the green ghost effect when placing items, utilizes the copy method in spriteManager
  void ghost(){
    //accesses player hotbar to grab the in-hand object
    int hotbarAccessIndex = game.keyManager.lastNumKey;
    
    //toClone is the object grabbed from the hotbar
    AbstractSprite toClone = game.player.hotbar.inventoryArray[hotbarAccessIndex];
    
    //toClone is cloned 
    AbstractSprite clone = game.spriteManager.copy(toClone);
    
    //places the ghost(clone)
    clone.direction = currentDirection;
      //colors it green
    clone.colorImage(color(0, 200, 0));
    place(mouseX, mouseY, clone);
    
    game.spriteManager.tempSprites.add(clone);
  }
  
  void rotate(){
    switch(currentDirection){
      case "north":
        currentDirection = "east";
        break;
      case "east":
        currentDirection = "south";
        break;
      case "south":
        currentDirection = "west";
        break;
      case "west":
        currentDirection = "north";
        break;
    }
  }
  
  //
  //
  
  //auxiliary methods
    //actually moves the sprite to the correct spot, only a method because I use the code atleast twice
  void planePlace(int placeX, int placeY, AbstractSprite toPlace){
    plane[placeY/50][placeX/50] = toPlace;
    print("Y: " + placeY/50 + " X: " + placeX/50);
  }
  
  void place(int x, int y, AbstractSprite toPlace){
     AbstractSprite toPlaceClone = game.spriteManager.copy(toPlace);
    
    toPlaceClone.x = x/50 * 50;
    toPlaceClone.y = y/50 * 50;
    
    System.out.println(toPlace.toString());
    System.out.println(toPlaceClone.toString());
    
    ArrayList<AbstractSprite> spawnIn = game.spriteManager.getSpriteList(toPlaceClone);
    game.spriteManager.listSpawn(spawnIn, toPlaceClone);
    
    print(spawnIn.size());
   }
  
 }


//--------------------


class SpriteManager {
  //arraylists for every category of sprite
  ArrayList<AbstractSprite> objectSprites = new ArrayList<AbstractSprite>(); // 0
  ArrayList<AbstractSprite> functionSprites = new ArrayList<AbstractSprite>(); // 1
  ArrayList<AbstractSprite> APISprites = new ArrayList<AbstractSprite>(); //2
  ArrayList<AbstractSprite> variableSprites = new ArrayList<AbstractSprite>(); // 3
  ArrayList<AbstractSprite> entitySprites = new ArrayList<AbstractSprite>(); // 4
  ArrayList<AbstractSprite> UISprites = new ArrayList<AbstractSprite>(); // 5
  ArrayList<AbstractSprite> tempSprites = new ArrayList<AbstractSprite>(); // 6
  
  //2d array containing all sprite array lists
  ArrayList<ArrayList<AbstractSprite> > spritesList =  new ArrayList<ArrayList<AbstractSprite> >();
  //2d array containing all sprite array list simple stringified names
  ArrayList<String> spritesListNames = new ArrayList<String>();
  
  //que to delete sprites 
  ArrayList<AbstractSprite> deleteQue = new ArrayList<AbstractSprite>();
  
  //2d que containing arraylist to delete sprites from
  ArrayList<ArrayList<AbstractSprite> > listDeleteFromQue =  new ArrayList<ArrayList<AbstractSprite> >();
  
  SpriteManager(){
    //initializes spritesList and spritesListNames
      spritesList.add(objectSprites);
      spritesListNames.add("object");
      
      spritesList.add(functionSprites);
      spritesListNames.add("function");
      
      spritesList.add(APISprites);
      spritesListNames.add("API");
      
      spritesList.add(variableSprites);
      spritesListNames.add("variable");
      
      spritesList.add(entitySprites);
      spritesListNames.add("entity");
      
      spritesList.add(UISprites);
      spritesListNames.add("UI");
      
      spritesList.add(tempSprites);
      spritesListNames.add("temp");
  }
  
  ArrayList<AbstractSprite> getSpriteList(AbstractSprite listed){
    int i = 0;
    for(String name: spritesListNames){
      if(name.contains(listed.getClass().getSimpleName())){
        return spritesList.get(i);
      }
      i++;
    }
    return spritesList.get(i);
  }
  
  void updateSprites(){
    //executes the move and render methods of every sprite in every list
    //those lists coming first in the spritesList recieve priority 
    for(ArrayList<AbstractSprite> currentList: spritesList){
      for(AbstractSprite currentSprite: currentList){
        currentSprite.move();
        currentSprite.render();
      }
    }
    
    //deletes the temporary sprites
    for(AbstractSprite s: tempSprites){
      delete(tempSprites, s);
    }
    
    clearDelete();
  }
  
  void listSpawn(ArrayList<AbstractSprite> spawnIn, AbstractSprite toAdd){
    //adds sprite to specific sprite array
    spawnIn.add(toAdd);
  }
  void spawn(int spawnIndex, AbstractSprite toAdd){
    //adds sprite to specific sprite array
    spritesList.get(spawnIndex).add(toAdd);
  }
  
  void delete(ArrayList<AbstractSprite> listDeleteFrom, AbstractSprite toDelete){
    deleteQue.add(toDelete);
    listDeleteFromQue.add(listDeleteFrom);
  }
  
  void clearDelete(){
    for(int i = 0; i < deleteQue.size(); i++){
      listDeleteFromQue.get(i).remove(deleteQue.get(i));
    }
  }
  
  AbstractSprite copy(AbstractSprite toClone){
    //Class of toClone is grabbed 
    Class toClass = toClone.getClass();
    print(toClass + "\n");
    
    //toClass is used to grab toClone's copy constructor
    Constructor toConstruct = null;
    try{
      toConstruct = toClass.getDeclaredConstructor(P4Torio.class, toClass);
    } catch(NoSuchMethodException e){
      print(e);
    }
    
    //superConstruct is initialized with the cosntructor of the P4Torio superclass
    Constructor superConstruct = null;
    try{
      superConstruct = P4Torio.class.getDeclaredConstructor();
    } catch(Exception e){
      e.printStackTrace(System.out);
    }
    
    //superConstruct is used to make an instance of the P4Torio superclass to be used in the copy constructor
    P4Torio superInstance = null;
    try{
      superInstance = (P4Torio) superConstruct.newInstance();
    } catch(Exception e){
      e.printStackTrace(System.out);
    }
   
    AbstractSprite clone = null;
    try{
      clone = (AbstractSprite) toConstruct.newInstance(superInstance, toClone);
    } catch(Exception e){
      e.printStackTrace(System.out);
    }
    
    return clone;
  }
}


//--------------------


class MouseManager {
  
}
