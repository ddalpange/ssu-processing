import { Color } from "p5";
import { Drawable } from "../interfaces/Drawable";

export class Rock1 extends Drawable {
  public hp: number = 10;
  private borderWith: number = 4;
  private c: Color;

  constructor(x: number, y: number, c: Color) {
    super(x, y, 60, 60);
    this.c = c;
  }

  draw(): void {
    let abstractX: number = this.x;
    let abstractY: number = this.y;

    // 손잡이
    p.push();
    p.push();
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    p.beginShape();
    p.fill(this.c);
    p.vertex((this.w / 100) * 20, (this.h / 100) * 15);
    p.vertex((this.w / 100) * 40, (this.h / 100) * 7);
    p.vertex((this.w / 100) * 60, (this.h / 100) * 7);
    p.vertex((this.w / 100) * 70, (this.h / 100) * 15);
    p.vertex((this.w / 100) * 80, (this.h / 100) * 40);

    p.vertex((this.w / 100) * 70, (this.h / 100) * 45);
    p.vertex((this.w / 100) * 20, (this.h / 100) * 45);
    p.vertex((this.w / 100) * 10, (this.h / 100) * 35);
    p.endShape(p.CLOSE);
    p.pop();
    p.pop();
  }
}
