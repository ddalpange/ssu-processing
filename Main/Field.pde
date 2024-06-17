public class Field extends Drawable {
    float[] suSuX;
    float[] suSuHeight;
    float[][] suSuLeafLength;
    float[][] suSuLeafAngle;
    float[][] suSuLeafY;

    public Field() {
        super(0, 0, 100, 100);
        
        suSuX = new float[50];
        suSuHeight = new float[50];
        suSuLeafLength = new float[50][5];
        suSuLeafAngle = new float[50][5];
        suSuLeafY = new float[50][5];
        
        for (int i = 0; i < 50; i++) {
          suSuX[i] = random(width);
          suSuHeight[i] = random(100, 150);
          for (int j = 0; j < 5; j++) {
            suSuLeafLength[i][j] = random(30, 50);
            suSuLeafAngle[i][j] = random(-PI / 4, PI / 4);
            suSuLeafY[i][j] = random(suSuHeight[i] * 0.2, suSuHeight[i] * 0.8);
          }
        }
    }

    @Override
    public void draw() {
        pushStyle();

        drawHills();
        drawSuSuField();

        popStyle();
    }

    void drawHills() {
      noStroke();

      fill(154, 210, 142);
      rect(0, height * 0.75, width, height * 0.25);

      fill(134, 100, 10);
      rect(0, height * 0.74, width, height * 0.05);

      fill(60, 179, 113);
      beginShape();
      vertex(0, height * 0.75);
      vertex(width, height * 0.75);
      vertex(width, height * 0.55);
      vertex(0, height * 0.65);
      endShape(CLOSE);

      fill(34, 139, 34);
      beginShape();
      vertex(0, height * 0.65);
      vertex(width, height * 0.55);
      vertex(width, height * 0.35);
      vertex(0, height * 0.45);
      endShape(CLOSE);

      fill(0, 128, 0);
      beginShape();
      vertex(0, height * 0.45);
      vertex(width, height * 0.35);
      vertex(width, height * 0.15);
      vertex(0, height * 0.25);
      endShape(CLOSE);
    }

    void drawSuSuField() {
      for (int i = 0; i < 50; i++) {
          drawSuSu(suSuX[i], height * 0.75, suSuHeight[i], i);
      }
    }

    void drawSuSu(float x, float y, float height, int index) {
      stroke(85, 107, 47);
      strokeWeight(4);
      line(x, y, x, y - height);

      for (int i = 0; i < 5; i++) {
        drawSuSuLeaf(x, y - suSuLeafY[index][i], suSuLeafLength[index][i], suSuLeafAngle[index][i]);
      }

      drawSuSuFlower(x, y - height, 20);
    }

    void drawSuSuLeaf(float x, float y, float length, float angle) {
        pushMatrix();
        translate(x, y);
        rotate(angle);
        stroke(34, 139, 34); // 짙은 녹색
        line(0, 0, length, 0);
        popMatrix();
    }

    void drawSuSuFlower(float x, float y, float size) {
        fill(255, 215, 0); // 황금색
        noStroke();
        ellipse(x, y, size, size * 1.5);
    }
}
