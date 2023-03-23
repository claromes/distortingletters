class Mouse {
  float radius;
  PVector pos;
  
  Mouse(float r) {
    radius = r;
    pos = new PVector(0, 0);
  }
  
  void update() {
    pos.set(mouseX, mouseY);
  }
  
  void drawNewPoints() {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
    circle(pos.x, pos.y, radius*2);
  }
}
