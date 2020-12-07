class SpaceShip extends GameObject {
  //1. instance variables 
  PVector direction;
  int countShot;
  int alpha; //transparency
  int alphaRate; //Rate of change for transparency
  int alphaCount; //Count number of time transparency has changed

  //2. constructors
  SpaceShip() {
    //x = width/2;
    //y = height/2;
    location = new PVector(width/2, height/2);

    //vx = 0;
    //vy = 0;
    direction = new PVector(0.05, 0);
    velocity = new PVector(0, 0);

    hitPoints = 3;
    countShot = 0;
    countInvulner = 0;
    alpha = 255;
    alphaRate = 51;
    alphaCount = 0;
  }

  //3. behavior functions

  void show () {
    pushMatrix();
    rectMode(CENTER);
    stroke(255, alpha);
    fill(0, alpha);
    translate(location.x, location.y);
    rotate(direction.heading());

    triangle(18.75, 0, -18.75, 10, -18.75, -10);

    if (w) {
      triangle(-28.75, 4, -18.75, 7, -18.75, 1);
      triangle(-28.75, -4, -18.75, -1, -18.75, -7);
      triangle(-33.75, 0, -18.75, 4, -18.75, -4);
    }

    if (a&&!w) {
      triangle(-28.75, 3, -18.75, 6, -18.75, -2) ;
    }

    if (d&&!w) {
      triangle(-28.75, -3, -18.75, 2, -18.75, -6);
    }

    if (countInvulner > 0) {
      if(alphaCount % 10 < 5) {
        alpha -= alphaRate;
        alphaCount++;
      }
      else {
        alpha += alphaRate;
        alphaCount++;
      }
    }
    popMatrix();
  }

  void act () {
    pushMatrix();
    if (a) direction.rotate(-radians(2));    
    if (d) direction.rotate(radians(2));
    if (w) velocity.add(direction);
    for (int i = 0; i < 4; i++) if (w) myObjects.add(new Fire());
    if (s) velocity.sub(direction);
    if (space && countShot > 30) {
      myObjects.add(new Bullet());
      countShot = 0;
    }
    countShot++;

    if(velocity.mag() > 5) velocity.setMag(5);
    
    if(countInvulner > 0) countInvulner --;
    
    super.act();

    if (location.x > 850) location.x = -50;
    if (location.x < -50) location.x = 850;
    if (location.y > 850) location.y = -50;
    if (location.y < -50) location.y = 850;

    //x += vx;
    //y += vy;
    popMatrix();
  }
}
