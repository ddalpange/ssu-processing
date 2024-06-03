import { Drawable } from "../interfaces/Drawable";

export class HPBar extends Drawable {
  public hp: number = 10;
  private borderWith: number = 4;

  constructor(x: number, y: number) {
    super(x, y, 300, 100);
  }

  public draw(): void {
    let abstractX: number = this.x;
    let abstractY: number = this.y;

    // 손잡이
    p.push();
    p.push();
    // fill(#DD9A5E);
    p.stroke("#DD9A5E");
    p.strokeWeight(this.borderWith);
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    // 안쪽 radius가 안먹어서 수정, radius 필요할 시 한번 더 감싸는게 나을지도 ..
    p.rect(0, 0, this.w, this.h);
    p.pop();
    p.pop();

    p.push();
    p.push();
    p.noStroke();
    p.fill(200, 0, 0);
    p.strokeWeight(2);
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    // stoke가 inside, outisde 반반으로 먹음.
    let buffer: number = this.borderWith / 2;
    p.rect(buffer, buffer, (this.w * this.hp) / 100 - buffer, this.h - buffer);
    p.pop();
    p.pop();
  }
}
