public class Mountain extends Drawable {

  public Mountain(float x, float y) {
    super(x, y, 100, 100);
  }

  public Mountain(float x, float y, int zIndex) {
    super(x, y, 100, 100, zIndex);
  }

  @Override
  public void draw() {
  float abstractX = x;
  float abstractY = y;

  pushStyle();
  strokeWeight(41);
  strokeCap(SQUARE);

  stroke(#598159);
  fill(#598159);
  rect(abstractX+106, abstractY+8, 144, 326);
  rect(abstractX+125, abstractY+124, 235, 326);
  rect(abstractX+598, abstractY+-73, -83, 524);

  stroke(#3B4F3B);
  line(abstractX+685, abstractY+602, abstractX+624, abstractY+-162);
  line(abstractX+643, abstractY+-144, abstractX+475, abstractY+-150);
  line(abstractX+448, abstractY+478, abstractX+496, abstractY+-153);
  line(abstractX+460, abstractY+540, abstractX+370, abstractY+81);
  line(abstractX+384, abstractY+98, abstractX+275, abstractY+84);
  line(abstractX+295, abstractY+83, abstractX+251, abstractY+-131);
  line(abstractX+266, abstractY+-115, abstractX+159, abstractY+-134);
  line(abstractX+155, abstractY+-5, abstractX+179, abstractY+-129);
  line(abstractX+76, abstractY+-14, abstractX+175, abstractY+-13);
  line(abstractX+29, abstractY+522, abstractX+96, abstractY+-29);

  stroke(#446444);
  line(abstractX+637, abstractY+491, abstractX+590, abstractY+-126);
  line(abstractX+514, abstractY+-109, abstractX+605, abstractY+-107);
  line(abstractX+486, abstractY+510, abstractX+534, abstractY+-123);
  line(abstractX+454, abstractY+711, abstractX+342, abstractY+122);
  line(abstractX+362, abstractY+134, abstractX+250, abstractY+118);
  line(abstractX+267, abstractY+136, abstractX+219, abstractY+-104);
  line(abstractX+191, abstractY+-93, abstractX+239, abstractY+-88);
  line(abstractX+183, abstractY+47, abstractX+216, abstractY+-106);
  line(abstractX+112, abstractY+26, abstractX+190, abstractY+27);
  line(abstractX+81, abstractY+497, abstractX+128, abstractY+7);


  stroke(#AAC5D8);
  fill(#AAC5D8);
  line(abstractX+-51, abstractY+438, abstractX+-41, abstractY+-53);
  rect(abstractX+-538, abstractY+-22, 127, 470);
  rect(abstractX+20, abstractY+161, -254, 255);

  stroke(#49687D);
  line(abstractX+-655, abstractY+813, abstractX+-543, abstractY+-111);
  line(abstractX+-375, abstractY+-90, abstractX+-564, abstractY+-95);
  line(abstractX+-339, abstractY+431, abstractX+-394, abstractY+-108);
  line(abstractX+-314, abstractY+449, abstractX+-272, abstractY+115);
  line(abstractX+-116, abstractY+96, abstractX+-287, abstractY+132);
  line(abstractX+-119, abstractY+121, abstractX+-89, abstractY+-89);
  line(abstractX+24, abstractY+-75, abstractX+-109, abstractY+-72);
  line(abstractX+16, abstractY+154, abstractX+4, abstractY+-67);
  line(abstractX+20, abstractY+132, abstractX+112, abstractY+135);
  line(abstractX+87, abstractY+544, abstractX+94, abstractY+115);

  stroke(#6A9EC6);
  line(abstractX+-591, abstractY+551, abstractX+-508, abstractY+-66);
  line(abstractX+-414, abstractY+-58, abstractX+-529, abstractY+-58);
  line(abstractX+-374, abstractY+453, abstractX+-430, abstractY+-77);
  line(abstractX+-276, abstractY+477, abstractX+-238, abstractY+146);
  line(abstractX+-69, abstractY+129, abstractX+-256, abstractY+164);
  line(abstractX+-83, abstractY+146, abstractX+-53, abstractY+-53);
  line(abstractX+-15, abstractY+-41, abstractX+-74, abstractY+-43);
  line(abstractX+-21, abstractY+152, abstractX+-36, abstractY+-52);
  line(abstractX+-42, abstractY+169, abstractX+74, abstractY+172);
  line(abstractX+49, abstractY+426, abstractX+55, abstractY+153);
  popStyle();
  }
}
