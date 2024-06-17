import { Drawable } from "../interfaces/Drawable";

export class Moon extends Drawable {
  constructor(x: number, y: number, size: number) {
    super(x + size / 2, y + size / 2, size, size);
  }

  draw(): void {
    let abstractX = this.x;
    let abstractY = this.y;
    let abstractSize = this.w;

    p.push();
    // 기존 원
    p.fill(255, 216, 72, 255);
    p.ellipse(abstractX, abstractY, abstractSize, abstractSize);

    // 무늬
    p.fill(232, 184, 61, 200);
    p.ellipse(
      abstractX + abstractSize * 0.37,
      abstractY,
      abstractSize * 0.12,
      abstractSize * 0.2
    );
    p.ellipse(
      abstractX + abstractSize * 0.37,
      abstractY - abstractSize * 0.17,
      abstractSize * 0.067,
      abstractSize * 0.067
    );
    p.ellipse(
      abstractX + abstractSize * 0.37,
      abstractY + abstractSize * 0.17,
      abstractSize * 0.033,
      abstractSize * 0.033
    );
    p.ellipse(
      abstractX + abstractSize * 0.3,
      abstractY + abstractSize * 0.13,
      abstractSize * 0.067,
      abstractSize * 0.067
    );
    p.ellipse(
      abstractX - abstractSize * 0.37,
      abstractY - abstractSize * 0.13,
      abstractSize * 0.053,
      abstractSize * 0.053
    );
    p.ellipse(
      abstractX - abstractSize * 0.27,
      abstractY - abstractSize * 0.27,
      abstractSize * 0.08,
      abstractSize * 0.08
    );
    p.ellipse(
      abstractX - abstractSize * 0.33,
      abstractY - abstractSize * 0.2,
      abstractSize * 0.027,
      abstractSize * 0.027
    );
    p.ellipse(
      abstractX - abstractSize * 0.13,
      abstractY + abstractSize * 0.4,
      abstractSize * 0.053,
      abstractSize * 0.053
    );
    p.ellipse(
      abstractX - abstractSize * 0.2,
      abstractY + abstractSize * 0.4,
      abstractSize * 0.02,
      abstractSize * 0.02
    );
    p.ellipse(
      abstractX - abstractSize * 0.27,
      abstractY + abstractSize * 0.33,
      abstractSize * 0.04,
      abstractSize * 0.04
    );
    p.pop();
  }
}
