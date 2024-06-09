import { Drawable } from "../interfaces/Drawable";

export class Hammer extends Drawable {
  public constructor(x = 1, y = 1) {
    super(x, y, 300, 150);
  }

  public draw() {
    const abstractX = this.x;
    const abstractY = this.y;
    // 손잡이
    p.push();
    p.fill("#DD9A5E");
    p.noStroke();
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    p.rectMode(p.CENTER);
    p.rect(this.w / 2, this.h / 2, this.w, this.h * 0.22, 30);
    p.pop();

    // 머리
    p.push();
    p.fill("#DD9A5E");
    p.noStroke();
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    p.rectMode(p.CENTER);
    p.rect(this.w * 0.8, this.h / 2, this.w * 0.2, this.h, 20);
    p.pop();
  }
}
