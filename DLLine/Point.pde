class Point {
  PVector currPos, desiredPos, initPos;
  int timer = 0, maxTimer = 60;

  Point(float x, float y) {
    currPos = new PVector(x, y);
    desiredPos = new PVector(x, y);
    initPos = new PVector(x, y);
  }

  void move(PVector m) {
    currPos.add(m);
    desiredPos.add(m);
    initPos.add(m);
  }
  
  void pointPlay(PVector m) {
    float noise = noise(desiredPos.x * 0.002, desiredPos.y * 0.002);
    if (sizeCheck()) {
      m = m.copy().mult(-noise);
    } else m = m.copy().mult(noise);
    
    //desiredPos.add(m);
    desiredPos = PVector.add(m, initPos);
    timer = 0;
  }

  boolean sizeCheck() {
    PVector mousePos = PVector.sub(mouse.pos, initPos);
    float angle = mousePos.heading() + TWO_PI;
    float result = (angle - mouse.angle) % TWO_PI;
    
    if (result > PI) return true;
    else return false;
  }

  void update() {
    if(timer < maxTimer) timer++;
    else desiredPos = initPos.copy();
    
    currPos.lerp(desiredPos, 0.1);
  }

  void drawPoints() {
    update();
    vertex(currPos.x, currPos.y);
  }
}
