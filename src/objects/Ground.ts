import { Drawable } from "../interfaces/Drawable";

export class Ground extends Drawable {
  private c: string;

  constructor(zIndex: number, c: string) {
    super(0, (p.height / 3) * 2, p.width, p.height / 3, zIndex);
    this.c = c;
  }

  draw(): void {
    p.push();

    p.noStroke();
    p.fill(this.c);
    p.rect(this.x, this.y, this.w, this.h);

    p.pop();
  }

  onClick(): void {}
}
