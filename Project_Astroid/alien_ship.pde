class AlienShip extends GameObject{
  
  PVector direction;
  int countShot;
  
  AlienShip() {
    //x = width/2;
    //y = height/2;
    size = 60;
    int x = (int)random(1,5);

    if (x == 1) location = new PVector(-size/2, random(size/8,height-size/2));
    if (x == 2) location = new PVector(width+size/2, random(size/8,height-size/2));
    if (x == 3) location = new PVector(random(size/2,width-size/2), -size/8);
    if (x == 4) location = new PVector(random(size/2,width-size/2), height+size/2);
    
    //vx = 0;
    //vy = 0;
    direction = new PVector(0.05, 0);
    velocity = new PVector(2, 0);
    velocity.rotate(radians(random(360)));

    hitPoints = 1;
    countShot = 0;
    
  }
  
  void show () {
    pushMatrix();
    rectMode(CENTER);
    stroke(255);
    fill(0);
    translate(location.x, location.y);

    ellipse(0,-size/6,size/3,size/3);
    ellipse(0,0,size,size/4);

    //rect(0, 0, 75, 20);
    popMatrix();
    //println((int)velocity.mag());
  }
  
  void showIntro () {
    pushMatrix();
    rectMode(CENTER);
    stroke(255);
    fill(0);
    translate(location.x, location.y);
    rotate(velocity.heading());

    triangle(18.75, 0, -18.75, 10, -18.75, -10);


    //rect(0, 0, 75, 20);
    popMatrix();
    //println((int)velocity.mag());
  }

  void act () {
    pushMatrix();
    if (countShot >90) {
      myObjects.add(new Bullet(location.x, location.y));
      countShot = 0;
    }
    countShot++;

    if(velocity.mag() > 5) velocity.setMag(5);
    
    super.act();

    if (location.x > width+size/2) location.x = -size/2;
    if (location.x < -size/2) location.x = width + size/2;
    if (location.y > height+size/2) location.y = -size/2;
    if (location.y < -size/2) location.y = width + size/2;

    //x += vx;
    //y += vy;
    popMatrix();
  }
  
}
