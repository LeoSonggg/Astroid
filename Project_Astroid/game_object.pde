class GameObject {
  
  PVector location;
  PVector velocity;
  float size;
  int hitPoints; 
  boolean alien = false; //If the bullet is shoot by alien ship
  int countInvulner; //The Invulnerable period of time after the space ship is hit
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    strokeWeight(1);
    stroke(255);
    fill(0);
    rect(0, 0, size, size);
    popMatrix();
  }
  
  void act() {
    location.add(velocity); 
  }
}
