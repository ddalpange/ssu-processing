class BloodParticle extends Particle {
  PVector velocity;
  float diameter;
  float gravity = 0.1;
  float friction = 0.99;

  BloodParticle(float x, float y) {
    super(new PVector(x, y));
    velocity = PVector.random2D();
    velocity.mult(random(2, 10));
    diameter = random(5, 15);
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
    noStroke();
    fill(255, 0, 0, lifespan);
    ellipse(x, y, diameter, diameter);
    popStyle();
  }
}
