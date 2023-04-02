import geomerative.*;
Text quote;
Mouse mouse;

void setup() {
  size(800, 600);

  RG.init(this);
  RG.setPolygonizerLength(5);

  String txt = ".pde";
  int textSizePx = 280;
  String font = "Pixellari.ttf";

  quote = new Text(txt, textSizePx, font);
  mouse = new Mouse(20);
}

void draw() {
  background(0);

  mouse.update();
  quote.drawText();
  mouse.drawNewText();
}
