public class SpriteAnimation extends Drawable {
  private PImage[] images;
  private float cycleSeconds;
  private float frameSeconds;
  private float timeElapsed;
  private int currentFrame;
  private int nTimes;
  private int nTimesPlayed;
  private boolean manualMode;

  public SpriteAnimation(PImage[] images) {
    this.images = images;
    this.scale = new PVector(1, 1);
  }

  public void playNTimes(float cycleSeconds, int n) {
    this.cycleSeconds = cycleSeconds;
    this.frameSeconds = cycleSeconds / images.length;
    this.nTimes = n;
    this.timeElapsed = 0;
    this.currentFrame = 0;
    this.nTimesPlayed = 0;
  }

  @Override
  public void draw() {
    pushStyle();
    pushMatrix();

    PImage image = null;
    if (manualMode) {
      image = getManualMode();
    } else {
      image = updateAutomaticMode();
    }

    imageMode(CENTER);
    rotate(radians(zAngle));
    if (image == null) {
      println("image is null");
    } else {
      image(image, x, y, image.width * scale.x, image.height * scale.y);
    }

    popMatrix();
    popStyle();
  }

  private PImage updateAutomaticMode() {
    PImage image = null;
    if (nTimesPlayed < nTimes) {
      image = images[currentFrame];

      timeElapsed += deltaTime;
      if (timeElapsed > frameSeconds) {
        timeElapsed = 0;
        nextFrame();
      }
    }
    else {
      // draw last frame
      image = images[images.length - 1];
    }

    return image;
  }

  private PImage getManualMode() {
    return images[currentFrame];
  }

  public void nextFrame() {
    currentFrame++;
    if (currentFrame >= images.length) {
      currentFrame = 0;
      nTimesPlayed++;
    }
  }
}
