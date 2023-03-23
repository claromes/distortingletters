import geomerative.*;
Text quote;
Mouse mouse;

void setup() {
  size(800, 600);

  /* setup  geomerative */
  RG.init(this);
  RG.setPolygonizerLength(3); // point space

  String txt = ".pde";
  int textSizePx = 300;
  String font = "Pixellari.ttf";

  quote = new Text(txt, textSizePx, font);
  mouse = new Mouse(80);
}

void draw() {
  background(0);

  mouse.update();
  quote.drawPoints();
  mouse.drawNewPoints();
}
