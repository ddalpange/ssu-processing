import { Drawable } from "../interfaces/Drawable";
import { PVector } from "../interfaces/PVector";

export class Particle extends Drawable {
  lifespan: number;

  constructor(position: PVector);
  constructor(position: PVector, lifespan: number);
  constructor(position: PVector, lifespan?: number) {
    super(position.x, position.y, 0, 0);
    this.lifespan = lifespan ?? 255;
  }

  update(): void {}

  draw(): void {}

  isDead(): boolean {
    return this.lifespan < 0;
  }
}
