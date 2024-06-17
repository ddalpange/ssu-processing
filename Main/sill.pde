public class Sill extends Drawable {
  private int numPoints;
  private float[] xList;
  private float[] yList;

  public Sill(float x, float y, float w, float h, int numPoints, float[] xList, float[] yList) {
    super(x, y, w, h);
    this.numPoints = numPoints;
    this.xList = xList;
    this.yList = yList;
  }

  @Override
  public void draw() {
    float spacing = w / 8;

    background(255);
    stroke(0);
    fill(0);

    
    for (int i = 0; i < numPoints - 1; i++) {
      ellipse(x + xList[i], y + yList[i], 5, 5);  
      strokeWeight(1);
      line(x + xList[i], y + yList[i], x + xList[i + 1], y + yList[i + 1]);  
    }
    
    ellipse(x + xList[numPoints - 1], y + yList[numPoints - 1], 5, 5);
    strokeWeight(5);
    line(
      x + xList[0], 
      y + (yList[1] + yList[2]) / 2, 
      x + xList[xList.length - 1], 
      y + yList[yList.length - 1]
    );  
    stroke(255, 0, 0);
    strokeWeight(4);
    line(
      x + xList[0], 
      y + (yList[1] + yList[2]) / 2 - 3, 
      x + xList[xList.length - 1], 
      y + yList[yList.length - 1] - 3
    );  
  }
}
