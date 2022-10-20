//package org.apache.commons.lang3;

import java.util.*;
import java.lang.reflect.*;
import java.io.*;
//import org.apache.commons.lang3.SerializationUtils;


class Game {
  //player
  Player player;
  
  //managers
  SpriteManager spriteManager = new SpriteManager();
  PlaneManager planeManager = new PlaneManager();
  KeyManager keyManager = new KeyManager();
  
  void play(){
    background(255);
    //planeManager.ghost();
    spriteManager.updateSprites();
  }
   
  void config() {
    noStroke();
    rectMode(CENTER);
  }
  
  void load(){
    config();
    player = new Player(width/2, height/2, 50, 50, 200);
    spriteManager.spawn(4, game.player);
  }
}
