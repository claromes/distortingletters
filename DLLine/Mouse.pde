class Mouse {
  float radius;
  PVector pos, vel;
  
  Mouse(float r) {
    radius = r;
    pos = new PVector(0, 0);
    vel = new PVector(0, 0);
  }
  
  void update() {
    PVector newPos = new PVector(mouseX, mouseY);
    
    vel = PVector.sub(newPos, pos);
    vel.mult(0.9);
    pos = newPos;
  }
  
  void drawNewText() {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
    circle(pos.x, pos.y, radius*2);
  }
}
