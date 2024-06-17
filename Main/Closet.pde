public class Closet1 extends Drawable {

  public Closet1(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float closetX = x;
    float closetY = y;
    pushStyle();

    noStroke();

    beginShape(); //side
    fill(#664836);
    vertex(closetX, closetY); //1
    vertex(closetX, closetY + 320); //2
    vertex(closetX + 40, closetY + 350); //3
    vertex(closetX + 40, closetY - 5); //4
    endShape(CLOSE);

    beginShape(); //front
    fill(139, 69, 19);
    vertex(closetX + 40, closetY - 5); //4
    vertex(closetX + 230, closetY + 5); //5
    vertex(closetX + 230, closetY + 330); //6
    vertex(closetX + 40, closetY + 350); //3
    endShape(CLOSE);

    beginShape(); //small front 1
    fill(139, 69, 19);
    strokeWeight(10);
    stroke(#4A371A);
    vertex(closetX + 55, closetY + 15); //7
    vertex(closetX + 55, closetY + 173); //8
    vertex(closetX + 125, closetY + 171); //9
    vertex(closetX + 125, closetY + 20); //10
    endShape(CLOSE);

    beginShape(); //small front 2
    fill(139, 69, 19);
    vertex(closetX + 150, closetY + 22); //11
    vertex(closetX + 150, closetY + 171); //12
    vertex(closetX + 215, closetY + 169); //13
    vertex(closetX + 215, closetY + 25); //14
    endShape(CLOSE);

    beginShape(); //small front 3
    fill(139, 69, 19);
    vertex(closetX + 55, closetY + 195); //15
    vertex(closetX + 55, closetY + 315); //16
    vertex(closetX + 125, closetY + 308); //17
    vertex(closetX + 125, closetY + 193); //18
    endShape(CLOSE);

    beginShape(); //small front 4
    fill(139, 69, 19);
    vertex(closetX + 150, closetY + 193); //20
    vertex(closetX + 150, closetY + 308); //21
    vertex(closetX + 215, closetY + 302); //22
    vertex(closetX + 215, closetY + 191); //23
    endShape(CLOSE);

    stroke(0);
    strokeWeight(1);
    line(closetX + 137, closetY, closetX + 137, closetY + 340);
    
    fill(#5C5030);
    ellipse(closetX+129,closetY + 182,7,7);
    ellipse(closetX+146,closetY + 182,7,7);

    popStyle();
  }
}

public class Closet2 extends Drawable {

  public Closet2(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float closetX = x;
    float closetY = y;
    pushStyle();

    noStroke();

    beginShape(); //side
    fill(#664836);
    vertex(closetX, closetY); //1
    vertex(closetX, closetY + 320); //2
    vertex(closetX + 60, closetY + 325); //3
    vertex(closetX + 60, closetY - 5); //4
    endShape(CLOSE);

    beginShape(); //front
    fill(139, 69, 19);
    vertex(closetX + 60, closetY - 5); //4
    vertex(closetX + 230, closetY + 5); //5
    vertex(closetX + 230, closetY + 310); //6
    vertex(closetX + 60, closetY + 325); //3
    endShape(CLOSE);

    beginShape(); //small front 1
    fill(139, 69, 19);
    strokeWeight(10);
    stroke(#4A371A);
    vertex(closetX + 70, closetY + 15); //7
    vertex(closetX + 70, closetY + 170); //8
    vertex(closetX + 132, closetY + 168); //9
    vertex(closetX + 132, closetY + 20); //10
    endShape(CLOSE);

    beginShape(); //small front 2
    fill(139, 69, 19);
    vertex(closetX + 154, closetY + 22); //11
    vertex(closetX + 154, closetY + 168); //12
    vertex(closetX + 215, closetY + 166); //13
    vertex(closetX + 215, closetY + 25); //14
    endShape(CLOSE);

    beginShape(); //small front 3
    fill(139, 69, 19);
    vertex(closetX + 70, closetY + 195); //15
    vertex(closetX + 70, closetY + 304); //16
    vertex(closetX + 132, closetY + 300); //17
    vertex(closetX + 132, closetY + 193); //18
    endShape(CLOSE);

    beginShape(); //small front 4
    fill(139, 69, 19);
    vertex(closetX + 154, closetY + 193); //20
    vertex(closetX + 154, closetY + 300); //21
    vertex(closetX + 215, closetY + 295); //22
    vertex(closetX + 215, closetY + 191); //23
    endShape(CLOSE);

    stroke(0);
    strokeWeight(1);
    line(closetX + 143, closetY, closetX + 143, closetY + 318);
    
    fill(#5C5030);
    ellipse(closetX+136,closetY + 182,7,7);
    ellipse(closetX+154,closetY + 182,7,7);
    
    popStyle();
  }
}