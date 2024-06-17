import { Particle } from "./Particle";
import { PVector } from "./PVector";

export class SleepParticle extends Particle {
  velocity: PVector;
  text: string;
  gravity: number = -0.02;
  friction: number = 0.99;

  constructor(x: number, y: number) {
    super(new PVector(x, y));
    this.velocity = new PVector(5, -3);
    this.text = "ZZZ";
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
    p.fill(0, this.lifespan);
    p.textSize(32);
    p.textAlign(p.CENTER, p.CENTER);
    p.text(this.text, this.x, this.y);
    p.pop();
  }
}
