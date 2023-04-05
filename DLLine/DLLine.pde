import geomerative.*;
Text quote;
Mouse mouse;

void setup() {
  size(600, 600);

  RG.init(this);
  RG.setPolygonizerLength(10);

  String txt = ".pde/.java/.js";
  int textSizePx = 180;
  String font = "Pixellari.ttf";

  quote = new Text(txt, textSizePx, font);
  mouse = new Mouse(80);
}

void draw() {
  background(0);

  mouse.update();
  quote.drawText();
  mouse.drawNewText();
}
