SpaceShip myShip;
AlienShip myAlien;
AlienShip myIntroAlien;

ArrayList<GameObject> myObjects;
ArrayList<GameObject> myIntros;

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

int time;
int astroidNum; //The total number of astroid
int point; //The number of Astroid destroyed

//Keys
boolean w,a,s,d,space;

float alphaIntro = 255; //transparency
float alphaRateIntro = 1.59375; //Rate of change for transparency
int alphaCountIntro = 0; //Count number of time transparency has changed
  

void setup() {
  size(800,800);
  mode = INTRO;
  myShip = new SpaceShip();
  myAlien = new AlienShip();
  myIntroAlien = new AlienShip();
  w = a = s = d = space = false;
  time = 0;
  astroidNum = 50;
  point = 0;
  
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  
  myIntros = new ArrayList<GameObject>();
  myIntros.add(new Astroid());
  myIntros.add(new Astroid());
  myIntros.add(new Astroid());
}

void draw() {
  if(mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
      println("ERROR! Mode is:" + mode); 
  }
}
