class Mouse {
  float angle = 0, radius =0, angleVel = 0, radiusVel = 0;
  PVector pos, center, vel;
  
  Mouse() {
    pos = new PVector(0, 0);
    center = new PVector(width * 0.5, height * 0.5);
    vel = new PVector(0 ,0);
  }
  
  void update() {
    float initAngle = angle;
    float initRadius = radius;
    
    PVector initPos = pos.copy();
    pos.set(mouseX, mouseY);
    vel = PVector.sub(pos, initPos);
    
    PVector posCenter = PVector.sub(pos, center);
    
    angle = posCenter.heading() - HALF_PI;
    radius = posCenter.mag();
    
    angleVel = angle - initAngle;
    radiusVel = radius - initRadius;
  }
  
  void centerChange(float x, float y) {
    center.set(x, y);
  }
  
  void drawNewText() {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
    line(pos.x, pos.y, center.x, center.y);
    
    push();
    
    translate(pos.x, pos.y);
    rotate(angle);
    
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
    line(-width, 0, width, 0);
    
    pop();
  }
}
