public class ShapeObject extends Drawable {
  protected PShape shape;
  protected PImage image;

  public ShapeObject(PShape shape) {
    super(0, 0, shape.width, shape.height);
    this.shape = shape;
    this.scale = new PVector(1, 1, 1);
  }

  public ShapeObject(PImage image) {
    super(0, 0, image.width, image.height);
    this.image = image;
    this.scale = new PVector(1, 1, 1);
  }
  
  @Override
  public void draw() {
    if (shape != null)
      drawShape();
    if (image != null)
      drawImage();
  }

  private void drawShape() {
    pushStyle();

    noStroke();
    shapeMode(CENTER);
    rotate(zAngle);
    shape(shape, x, y, w, h);

    popStyle();
  }

  private void drawImage() {
    pushStyle();
    pushMatrix();
    
    imageMode(CENTER);
    rotate(radians(zAngle));

    if (scale.x < 0) {
      pushMatrix();
      translate(x, y); 
      scale(-1, 1);
      image(image, 0, 0, w, h);
      popMatrix();
    } else {
      image(image, x, y, w, h);
    }
    
    popMatrix();
    popStyle();
  }
}