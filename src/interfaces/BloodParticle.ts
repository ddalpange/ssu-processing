import { PVector } from "./PVector";
import { Particle } from "./Particle";

export class BloodParticle extends Particle {
  velocity: PVector;
  diameter: number;
  gravity: number = 0.1;
  friction: number = 0.99;

  constructor(x: number, y: number) {
    super(new PVector(x, y));
    this.velocity = PVector.random2D();
    this.velocity.mult(Math.random() * (10 - 2) + 2);
    this.diameter = Math.random() * (15 - 5) + 5;
  }

  update(): void {
    this.velocity.y += this.gravity;
    this.velocity.mult(this.friction);
    this.x += this.velocity.x;
    this.y += this.velocity.y;
    this.lifespan -= 20.0;
  }

  draw(): void {
    p.push();
    p.noStroke();
    p.fill(255, 0, 0, this.lifespan);
    p.ellipse(this.x, this.y, this.diameter, this.diameter);
    p.pop();
  }
}
