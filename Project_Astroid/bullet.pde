class Bullet extends GameObject {

  boolean alien;
  
  Bullet() {
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y); 
    velocity.setMag(6 + myShip.velocity.mag());
  
    size = 10;
    hitPoints = 1;
    alien = false;
  }
  
  Bullet(float X, float Y) {
    location = new PVector (X, Y);
    velocity = new PVector (myShip.location.x - location.x, myShip.location.y - location.y); 
    velocity.setMag(3 + myShip.velocity.mag());
  
    size = 10;
    hitPoints = 1;
    alien = true;
  }

  void show() {
    strokeWeight(1);
    stroke(255);
    fill(0);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    
    super.act(); 
    if (location.x > 900 || location.x < -100 || location.y > 900 || location.y < -100) hitPoints = 0;
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if(myObj instanceof AlienShip && !alien && dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
        myObj.hitPoints --;
        hitPoints --;
        for (int x = 0; x < 12; x++) myObjects.add(new Fire(location.x, location.y, x));
      }
      else if(myObj instanceof SpaceShip && myShip.countInvulner == 0 && alien && dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
        myObj.hitPoints --;
        hitPoints --;
        myShip.countInvulner = 60;
        for (int x = 0; x < 12; x++) myObjects.add(new Fire(location.x, location.y, x));
      }
      i++;
    }
  }
}
