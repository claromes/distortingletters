class Text {
  Line[] lines;
  
  Text(String txt, int textSizePx, String font) {
    String[] texts = txt.split("/");
    
    float betweenLine = textSizePx * 0.8;
    float boundingBox = texts.length * betweenLine;
    float x = width * 0.5;
    float y = height * 0.5 + betweenLine - boundingBox * 0.5;
    
    lines = new Line[texts.length];
    
    for (int i =0; i < lines.length; i++) {
      lines[i] = new Line(x, y, texts[i], textSizePx, font);
      y += betweenLine;
    }
  }
  
  void drawText() {
    for (int i =0; i < lines.length; i++) {
      lines[i].drawLine();
    }
  }
}
