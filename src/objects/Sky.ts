import { Drawable } from "../interfaces/Drawable";

export class Sky extends Drawable {
  constructor(x: number, y: number, w: number, h: number) {
    super(x, y, w, h);
  }

  public draw(): void {
    p.noStroke();
    p.beginShape();
    p.fill(249, 252, 158, 180);
    p.vertex(this.x + 396, this.y + 56);
    p.vertex(this.x + 284, this.y + 126);
    p.vertex(this.x + 292, this.y + 166);
    p.vertex(this.x + 417, this.y + 74);
    p.endShape(p.CLOSE);

    p.beginShape();
    p.fill(249, 252, 158, 180);
    p.vertex(this.x + 462, this.y + 109);
    p.vertex(this.x + 417, this.y + 176);
    p.vertex(this.x + 441, this.y + 198);
    p.vertex(this.x + 492, this.y + 133);
    p.endShape(p.CLOSE);

    p.beginShape();
    p.fill(249, 252, 158, 180);
    p.vertex(this.x + 556, this.y + 152);
    p.vertex(this.x + 532, this.y + 307);
    p.vertex(this.x + 563, this.y + 313);
    p.vertex(this.x + 586, this.y + 158);
    p.endShape(p.CLOSE);

    p.beginShape();
    p.fill(249, 252, 158, 180);
    p.vertex(this.x + 666, this.y + 144);
    p.vertex(this.x + 704, this.y + 266);
    p.vertex(this.x + 740, this.y + 235);
    p.vertex(this.x + 692, this.y + 134);
    p.endShape(p.CLOSE);

    p.beginShape();
    p.fill(249, 252, 158, 180);
    p.vertex(this.x + 750, this.y + 91);
    p.vertex(this.x + 864, this.y + 261);
    p.vertex(this.x + 906, this.y + 248);
    p.vertex(this.x + 778, this.y + 74);
    p.endShape(p.CLOSE);

    p.beginShape();
    p.fill(249, 252, 158, 180);
    p.vertex(this.x + 818, this.y + 57);
    p.vertex(this.x + 909, this.y + 133);
    p.vertex(this.x + 938, this.y + 114);
    p.vertex(this.x + 838, this.y + 34);
    p.endShape(p.CLOSE);
  }
}
