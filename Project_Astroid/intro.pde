void intro() {
  background(0);

  int i = 0;   
  while(i < myIntros.size()){
    GameObject b = myIntros.get(i);
    b.show();
    b.act(); 
    i++;
  }


  if(alphaCountIntro % 320 < 160) {
    alphaIntro -= alphaRateIntro;
    alphaCountIntro++;
      }
  else {
    alphaIntro += alphaRateIntro;
    alphaCountIntro++;
  }
  
  myIntroAlien.showIntro();
  myIntroAlien.act(); 
  
  fill(255, alphaIntro);
  textSize(100);
  text("Astroid", 400, 200);
  
  button(400,525,200,50,40,"START");
  

}

void introClicks() {
  if(buttonPressed(400,525,200,50)) {
    setup();
    mode = GAME;
  }
}

void introPressed() {
  
}

void introReleased() {
  
}
