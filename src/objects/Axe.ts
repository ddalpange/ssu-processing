import { Drawable } from "../interfaces/Drawable";

export class Axe extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    let abstractX = this.x;
    let abstractY = this.y;

    // 손잡이
    p.push();
    p.push();
    p.fill("#DD9A5E");
    p.noStroke();
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    p.rectMode(p.CENTER);
    p.rect(abstractX + 5, abstractY - 78, 274, 44, 30);
    p.pop();
    p.pop();

    // 도끼 머리
    p.push();
    p.push();
    p.fill("#6C6E6E");
    p.noStroke();
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    p.quad(
      abstractX - 116,
      abstractY + 10,
      abstractX - 93,
      abstractY - 119,
      abstractX - 46,
      abstractY - 124,
      abstractX + -12,
      abstractY + 1
    );
    p.pop();
    p.pop();

    // 도끼 머리 하이라이트
    p.push();
    p.push();
    p.stroke(175, 173, 169);
    p.strokeWeight(23);
    p.noFill();
    p.curveTightness(0.6);
    p.translate(abstractX, abstractY);
    p.rotate(p.radians(this.zAngle));
    p.beginShape();
    p.curveVertex(abstractX - 494, abstractY - 80);
    p.curveVertex(abstractX - 107, abstractY + 10);
    p.curveVertex(abstractX - 22, abstractY + -2);
    p.curveVertex(abstractX + 284, abstractY - 218);
    p.endShape();
    p.pop();
    p.pop();
  }
}
