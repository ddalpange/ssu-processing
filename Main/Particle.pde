class Particle extends Drawable {
  float lifespan;

   Particle(PVector position) {
    this(position, 255);
  }

  Particle(PVector position, float lifespan) {
    super(position.x, position.y, 0, 0);
    this.lifespan = lifespan;
  }

  void update() {}

  @Override
  public void draw() {}

  boolean isDead() {
    return lifespan < 0;
  }
}
