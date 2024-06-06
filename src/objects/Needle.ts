import { Drawable } from "../interfaces/Drawable";

export class Needle extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    let abstractX = this.x;
    let abstractY = this.y;

    p.push();
    p.push(); // Save the transformation
    p.noStroke();

    p.fill("#A2A2A2");
    p.triangle(
      abstractX + 25,
      abstractY + 202,
      abstractX + 246,
      abstractY + 44,
      abstractX + 270,
      abstractY + 100
    );
    p.ellipse(abstractX + 258, abstractY + 72, 62, 62);

    p.fill("#ffffff");
    p.ellipse(abstractX + 258, abstractY + 71, 21, 20);

    p.rotate(p.radians(-26));
    p.fill("#ffffff");
    p.ellipse(abstractX + 126, abstractY + 193, 96, 8);

    p.rotate(p.radians(0));
    p.fill("#ffffff");
    p.ellipse(abstractX + 66, abstractY + 193, 10, 6);
    p.pop(); // Restore the transformation
    p.pop();
  }
}
