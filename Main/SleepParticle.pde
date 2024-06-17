class SleepParticle extends Particle {
  PVector velocity;
  String text;
  float gravity = -0.02;
  float friction = 0.99;

  SleepParticle(float x, float y) {
    super(new PVector(x, y));
    velocity = new PVector(5, -3);
    text = "ZZZ";
  }

  @Override
  void update() {
    velocity.y += gravity;
    velocity.mult(friction);
    x += velocity.x;
    y += velocity.y;
    lifespan -= 20.0;
  }

  @Override
  public void draw() {
    pushStyle();
    fill(0, lifespan);
    textSize(32);
    textAlign(CENTER, CENTER);
    text(text, x, y);
    popStyle();
  }
}