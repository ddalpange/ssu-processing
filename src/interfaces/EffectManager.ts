import { BloodParticle } from "./BloodParticle";
import { EffectType } from "./EffectType";
import type { Particle } from "./Particle";
import { SleepParticle } from "./SleepParticle";

export class EffectManager {
  particles: Particle[];

  constructor() {
    this.particles = [];
  }

  addParticles(x: number, y: number, type: EffectType) {
    if (type === EffectType.BLOOD) {
      for (let i = 0; i < 50; i++) {
        this.particles.push(new BloodParticle(x, y));
      }
    } else if (type === EffectType.SLEEP) {
      for (let i = 0; i < 1; i++) {
        this.particles.push(new SleepParticle(x, y));
      }
    }
  }

  updateAndDraw() {
    for (let i = this.particles.length - 1; i >= 0; i--) {
      const p = this.particles[i];
      p.update();
      p.draw();
      if (p.isDead()) {
        this.particles.splice(i, 1);
      }
    }
  }
}
