import { Drawable } from "../interfaces/Drawable";

export class Rock extends Drawable {
  constructor(x: number, y: number, w: number, h: number, zIndex: number) {
    super(x, y, w, h, zIndex);
  }

  draw(): void {
    p.rect(this.x, this.y, this.w, this.h);
  }

  onClick(): void {}
}
