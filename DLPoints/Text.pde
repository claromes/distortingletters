class Text {
  PVector[][] points; // [][] 2D (list size)
  
  /* constructor */
  Text(String txt, int textSizePx, String font) {
    RShape shp = RG.getText(txt, font, textSizePx, CENTER);
    RPoint[][] rPoints = shp.getPointsInPaths();
    
    points = new PVector[rPoints.length][];
    
    for (int i = 0; i < rPoints.length; i++) { // Each path
      points[i] = new PVector[rPoints[i].length];
      
      for (int j = 0; j < rPoints[i].length; j++ ) { // Each point of current path
        RPoint p = rPoints[i][j];
        // println(p.x, p.y);
        
        points[i][j] = new PVector(p.x, p.y);  
      }
    }
    centerText();
  }
  
  /* function center */
  void centerText() {
    PVector move = new PVector(width*0.5 - 30, height*0.5 + 90);
    
    for (int i = 0; i < points.length; i++) {
      for (int j = 0; j < points[i].length; j++) {
        PVector p = points[i][j];
        
        p.add(move);
      }
    }
  }
  
  /* function draw */
  void drawPoints() {
    //noFill();
    //stroke(0);
    //strokeWeight(3);
    fill(255);
    noStroke();
    
    beginShape();
    for (int i = 0; i < points.length; i++) { // Each path
      if (i > 0) beginContour(); // Draw path separately
      for (int j = 0; j < points[i].length; j++) {
        PVector p = points[i][j].copy(); // copy original point
        
        PVector mousePoint = PVector.sub(p, mouse.pos);
        
        float distance = mousePoint.mag();
        if (distance < mouse.radius) {
          float newSize = map(distance, 0, mouse.radius, 50, 0);
          mousePoint.setMag(newSize);
          
          p.add(mousePoint);
        }
        
      vertex(p.x, p.y);
      }
      if (i > 0) endContour();
    }
    endShape();
  } 
}
