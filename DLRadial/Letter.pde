class Letter {
  Point[][] points;
  float w = 0, h =0;

  Letter(RPoint[][] rPoints, float x) {
    points = new Point[rPoints.length][];

    for (int i = 0; i < rPoints.length; i++) {
      points[i] = new Point[rPoints[i].length];

      for (int j = 0; j < rPoints[i].length; j++ ) {
        RPoint p = rPoints[i][j];

        points[i][j] = new Point(p.x + x, p.y);

        w = max(w, p.x);
        h = max(h, -p.y);
      }
    }
  }

  void drawLetter() {
    beginShape();
    for (int i = 0; i < points.length; i++) {
      if (i > 0) beginContour();
      for (int j = 0; j < points[i].length; j++) {
        points[i][j].drawPoints();
      }
      if (i > 0) endContour();
    }
    endShape();
  }

  void move(PVector m) {
    for (int i = 0; i < points.length; i++) {
      for (int j = 0; j < points[i].length; j++) {
        points[i][j].move(m);
      }
    }
  }
  
  void letterPlay(PVector m) {
    for (int i = 0; i < points.length; i++) {
      for (int j = 0; j < points[i].length; j++) {
        points[i][j].pointPlay();
      }
    }
  }
}
