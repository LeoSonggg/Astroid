class Astroid extends GameObject{
  
  float direction;
  float turnspeed;

  
  Astroid() {
    boolean i = false;
    while(!i) {
      location = new PVector(random(width), random(height));
      if(abs(location.x - myShip.location.x) > 100 && abs(location.y - myShip.location.y) > 100) i = true;
    }
    velocity = new PVector(1, 0);
    velocity.rotate(random(2*PI));
    size = 80;
    hitPoints = 1;
    direction = random(-0.05, 0.05);
    turnspeed = random(-0.05, 0.05);
  }
  
  Astroid(int s, float x, float y) {
    hitPoints = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate (random (0, TWO_PI));
    size = s;
    direction = random(-0.05, 0.05);
    turnspeed = random(-0.05, 0.05);
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction);
    direction += turnspeed;
    ellipse(0, 0, size, size);
    popMatrix();
  }
  
  void act() {
    super.act();
    if(location.x > 850) location.x = -50;
    if(location.x < -50) location.x = 850;
    if(location.y > 850) location.y = -50;
    if(location.y < -50) location.y = 850;
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if(myObj instanceof Bullet && dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
        myObj.hitPoints --;
        hitPoints --;
        point ++;
        if(size > 40){
        myObjects.add(new Astroid((int)size-20, location.x, location.y));
        myObjects.add(new Astroid((int)size-20, location.x, location.y));
        }
        for (int x = 0; x < 12; x++) myObjects.add(new Fire(location.x, location.y, x));
      }
      else if(myObj instanceof SpaceShip && myShip.countInvulner == 0 && dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
        myObj.hitPoints --;
        hitPoints --;
        if (size == 80) point += 7;
        else if (size == 60) point += 3;
        else if (size == 40) point ++;
        for (int x = 0; x < 12; x++) myObjects.add(new Fire(location.x, location.y, x));
        myShip.countInvulner = 60;
      }
      i++;
    }
    
  }
}
