class EffectManager {
  ArrayList<Particle> particles;

  EffectManager() {
    particles = new ArrayList<Particle>();
  }

  void addParticles(float x, float y, EffectType type) {
    if (type == EffectType.BLOOD) {
      for (int i = 0; i < 50; i++) {
        particles.add(new BloodParticle(x, y));
      }
    } else if (type == EffectType.SLEEP) {
      for (int i = 0; i < 1; i++) {
        particles.add(new SleepParticle(x, y));
      }
    }
  }

  void updateAndDraw() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.draw();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

enum EffectType {
  BLOOD,
  SLEEP
}