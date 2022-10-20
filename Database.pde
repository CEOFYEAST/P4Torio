class Database {
  ArrayList<AbstractSprite> inventoryList;
  AbstractSprite[] inventoryArray;
  
  Database(){}
  Database(int arrayLength){
    inventoryArray = new AbstractSprite[arrayLength];
  }
}
class Hotbar extends Database {
  Hotbar(){
    super(10);
 
    AbstractSprite yellowBelt = new API(mouseX, mouseY, 1, "north", "assets/belt-yellow.jpg", color(0, 0, 255));
    super.inventoryArray[1]  = yellowBelt;
    inventoryArray[2] = new API(mouseX, mouseY, 1, "north", "assets/turn-belt-yellow.jpg", color(0, 0, 255));
    
  }
}
