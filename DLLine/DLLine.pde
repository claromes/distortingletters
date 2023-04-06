import geomerative.*;
Text quote;
Mouse mouse;

void setup() {
  size(600, 600);

  RG.init(this);
  RG.setPolygonizerLength(3);

  String txt = ".pde/.java/.js/.py";
  int textSizePx = 100;
  String font = "Pixellari.ttf";

  quote = new Text(txt, textSizePx, font);
}

void draw() {
  background(0);

  quote.drawText();
  if (mouse != null) {
    mouse.update();
    quote.textPlay();
    mouse.drawNewText();
  }
}

void mousePressed() {
  mouse = new Mouse(mouseX, mouseY);
}

void mouseReleased() {
  quote.textPlay();
  
  mouse = null;
}

void keyReleased() {
  if (key == ' ') save();
}

void save() {
  saveFrame("DL-#####.png");
}
