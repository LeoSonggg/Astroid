void game() {
  background(0);

  fill(0);
  textSize(100);
  text("GAME", 400, 200);
  buttonPause(400, 20, 30, 30);

  int i = 0; 
    
  while(i < myObjects.size()){
    GameObject b = myObjects.get(i);

   if(b instanceof AlienShip && time % 1500 == 0) {
      myObjects.remove(i);
    }
    
    if(b.hitPoints > 0) {
      b.show();
      b.act(); 
      i++;
    } 
    else myObjects.remove(i);
  }      

  myShip.show();
  myShip.act();


  if(time % 1500 == 500 ) {
    myObjects.add(new AlienShip());
  }
  
  
  time += 1;
  if(time % 240 == 0 && astroidNum > 0) {
    myObjects.add(new Astroid());
    astroidNum --;
  }
  
  if(myShip.hitPoints <= 0) mode = GAMEOVER;
  else if(astroidNum == 0 && point == 350) mode = GAMEOVER;
}

void gameClicks() {
  if (buttonPressed(400, 20, 30, 30))
    mode = PAUSE;
}

void gamePressed() {
  if (key == 'w' || key == 'W') w = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'd' || key == 'D') d = true;
  if (key == ' ') space = true;
}

void gameReleased() {
  if (key == 'w' || key == 'W') w = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'd' || key == 'D') d = false;
  if (key == ' ') space = false;
}
