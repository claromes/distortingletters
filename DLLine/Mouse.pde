class Mouse {
  float angle = 0;
  PVector pos;
  
  Mouse(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void update() {
    PVector m = new PVector(mouseX, mouseY);
    PVector mousePos = PVector.sub(m, pos);
    
    angle = mousePos.heading();
  }
  
  void drawNewText() {
    push();
    
    translate(pos.x, pos.y);
    rotate(angle);
    
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
    line(-width, 0, width, 0);
    
    noStroke();
    fill(255, 0, 0);
    circle(0, 0, 10);
    
    pop();
  }
}
