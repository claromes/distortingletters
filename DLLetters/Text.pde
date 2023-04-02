class Text {
  Letter[] letters;
  float w = 0, h = 0;

  Text(String txt, int textSizePx, String font) {
    letters = new Letter[txt.length()];

    for (int i = 0; i < txt.length(); i++) {
      String l = txt.charAt(i) + ""; //Add empty string to use charAt

      RShape shp = RG.getText(l, font, textSizePx, LEFT);
      RPoint[][] rPoints = shp.getPointsInPaths();

      letters[i] = new Letter(rPoints, w);

      w += letters[i].w;
      h = max(h, letters[i].h);
    }
    centerText();
  }

  /* function center */
  void centerText() {
    PVector m = new PVector(width*0.5 - w*0.5, height*0.5 + h*0.5);

    for (int i = 0; i < letters.length; i++) {
      letters[i].move(m);
    }
  }

  void drawText() {
    noFill();
    stroke(255);
    strokeWeight(2);
    //fill(255);
    //noStroke();

    for (int i = 0; i < letters.length; i++) {
      letters[i].drawLetter();
    }
  }
}
