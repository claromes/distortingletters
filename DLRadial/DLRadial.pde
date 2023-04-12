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
  mouse = new Mouse();
}

void draw() {
  background(0);

  quote.drawText();

  mouse.update();
  if(mousePressed) quote.textPlay();
  mouse.drawNewText();

}

//void mousePressed() {
//  mouse = new Mouse(mouseX, mouseY);
//}

//void mouseReleased() {
//  quote.textPlay();
  
//  mouse = null;
//}

void keyReleased() {
  if (key == 's') save();
  else if (key == ' ') mouse.centerChange(mouseX, mouseY);
}

void save() {
  saveFrame("DL-#####.png");
}
