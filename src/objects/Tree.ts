import { Drawable } from "../interfaces/Drawable";

export class Tree extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    const abstractX = this.x;
    const abstractY = this.y;

    p.push();
    p.noStroke();
    p.fill(abstractX + 139, 69, 19);
    p.triangle(
      abstractX + 233,
      abstractY + 323,
      abstractX + 195,
      abstractY + 176,
      abstractX + 158,
      abstractY + 323
    );

    p.fill("#337833");
    p.ellipse(abstractX + 119, abstractY + 213, 125, 110);
    p.ellipse(abstractX + 192, abstractY + 182, 120, 120);
    p.ellipse(abstractX + 257, abstractY + 204, 125, 110);

    p.fill(62, 175, 62);
    p.ellipse(abstractX + 118, abstractY + 197, 120, 120);
    p.ellipse(abstractX + 196, abstractY + 168, 130, 130);
    p.ellipse(abstractX + 262, abstractY + 186, 120, 119);

    p.fill(88, 211, 88);
    p.ellipse(abstractX + 106, abstractY + 170, 150, 150);
    p.ellipse(abstractX + 191, abstractY + 125, 188, 195);
    p.ellipse(abstractX + 275, abstractY + 163, 148, 151);

    p.pop();
  }
}
