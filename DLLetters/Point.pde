class Point {
  PVector pos, pos0;
  int timer = 0, maxTimer = round(random(150));

  Point(float x, float y) {
    pos = new PVector(x, y);
    pos0 = new PVector(x, y);
  }

  void move(PVector m) {
    pos.add(m);
    pos0.add(m);
  }

  void update() {
    if (mousePressed) {
      PVector mousePos = PVector.sub(pos, mouse.pos);
      float distance = mousePos.mag();
      
      if (distance < mouse.radius) {
        stroke(10);
        pos.add(mouse.vel);
        timer = 0;
      }
    }
    
    if(timer < maxTimer) timer++;
    else pos.lerp(pos0, 0.1);
    
  }

  void drawPoints() {
    update();
    vertex(pos.x, pos.y);
  }
}
