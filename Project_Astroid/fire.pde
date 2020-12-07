class Fire extends GameObject{
  
  int alpha; //transparency
  int alphaRate; //Rate of change fortransparency
  
  Fire() {
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y); 
    velocity.rotate(PI+random(-0.5,0.5));
    velocity.setMag(10);
    size = (int)(random(1,10));
    hitPoints = 1;
    alpha = 255;
    alphaRate = 20;
  }
  
  Fire(float X, float Y, int rotationRate) {
    location = new PVector (X, Y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y); 
    velocity.rotate(PI + random(-25,25) + rotationRate * 30);
    velocity.setMag(5);
    size = (int)(random(1,10));
    hitPoints = 1;
    alpha = 255;
    alphaRate = 10;
  }
  
  void show() { 

    strokeWeight(2);
    stroke(255, alpha);
    fill(0,alpha);
    rect(location.x, location.y, size, size);
    alpha -= alphaRate;
    if (alpha <= 0) hitPoints = 0;
    strokeWeight(1);
  }
  
  void act() {
    super.act();
  }
  
}
