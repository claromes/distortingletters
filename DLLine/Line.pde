class Line {
  Letter[] letters;
  float w = 0, h = 0;

  Line(float x, float y, String txt, int textSizePx, String font) {
    letters = new Letter[txt.length()];

    for (int i = 0; i < txt.length(); i++) {
      String l = txt.charAt(i) + "";

      RShape shp = RG.getText(l, font, textSizePx, LEFT);
      RPoint[][] rPoints = shp.getPointsInPaths();

      letters[i] = new Letter(rPoints, w);

      w += letters[i].w;
      h = max(h, letters[i].h);
    }
    centerLine(x, y);
  }

  /* function center */
  void centerLine(float x, float y) {
    PVector m = new PVector(x - w*0.5, y);

    for (int i = 0; i < letters.length; i++) {
      letters[i].move(m);
    }
  }

  void drawLine() {
    //noFill();
    //stroke(255);
    //strokeWeight(2);
    fill(255);
    noStroke();

    for (int i = 0; i < letters.length; i++) {
      letters[i].drawLetter();
    }
  }
}
