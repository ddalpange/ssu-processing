int 검은색부분= 130;
//void setup() {
//  size(800, 400); 
//}

//void draw() {
//  drawGradientBackground();  
//}

void drawGradientBackground() {
  for (int y = 0; y < height; y++) {
    color c;
    if (y < 검은색부분) {  
      c = color(28, 26, 38);
    } else {
      c = lerpColor(color(28, 26, 38), color(247, 176, 149), map(y - 검은색부분, 0, height - 검은색부분, 0, 1));
    }
    stroke(c);
    line(0, y, width, y);
  }
}
