import { Drawable } from "../interfaces/Drawable";

export class Closet1 extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    const closetX = this.x;
    const closetY = this.y;

    p.push();
    p.noStroke();

    p.beginShape(); // side
    p.fill("#664836");
    p.vertex(closetX, closetY); // 1
    p.vertex(closetX, closetY + 320); // 2
    p.vertex(closetX + 40, closetY + 350); // 3
    p.vertex(closetX + 40, closetY - 5); // 4
    p.endShape(p.CLOSE);

    p.beginShape(); // front
    p.fill(139, 69, 19);
    p.vertex(closetX + 40, closetY - 5); // 4
    p.vertex(closetX + 230, closetY + 5); // 5
    p.vertex(closetX + 230, closetY + 330); // 6
    p.vertex(closetX + 40, closetY + 350); // 3
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 1
    p.fill(139, 69, 19);
    p.strokeWeight(10);
    p.stroke("#4A371A");
    p.vertex(closetX + 55, closetY + 15); // 7
    p.vertex(closetX + 55, closetY + 173); // 8
    p.vertex(closetX + 125, closetY + 171); // 9
    p.vertex(closetX + 125, closetY + 20); // 10
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 2
    p.fill(139, 69, 19);
    p.vertex(closetX + 150, closetY + 22); // 11
    p.vertex(closetX + 150, closetY + 171); // 12
    p.vertex(closetX + 215, closetY + 169); // 13
    p.vertex(closetX + 215, closetY + 25); // 14
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 3
    p.fill(139, 69, 19);
    p.vertex(closetX + 55, closetY + 195); // 15
    p.vertex(closetX + 55, closetY + 315); // 16
    p.vertex(closetX + 125, closetY + 308); // 17
    p.vertex(closetX + 125, closetY + 193); // 18
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 4
    p.fill(139, 69, 19);
    p.vertex(closetX + 150, closetY + 193); // 20
    p.vertex(closetX + 150, closetY + 308); // 21
    p.vertex(closetX + 215, closetY + 302); // 22
    p.vertex(closetX + 215, closetY + 191); // 23
    p.endShape(p.CLOSE);

    p.stroke(0);
    p.strokeWeight(1);
    p.line(closetX + 137, closetY, closetX + 137, closetY + 340);

    p.fill("#5C5030");
    p.ellipse(closetX + 129, closetY + 182, 7, 7);
    p.ellipse(closetX + 146, closetY + 182, 7, 7);

    p.pop();
  }
}

export class Closet2 extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    const closetX = this.x;
    const closetY = this.y;

    p.push();
    p.noStroke();

    p.beginShape(); // side
    p.fill("#664836");
    p.vertex(closetX, closetY); // 1
    p.vertex(closetX, closetY + 320); // 2
    p.vertex(closetX + 60, closetY + 325); // 3
    p.vertex(closetX + 60, closetY - 5); // 4
    p.endShape(p.CLOSE);

    p.beginShape(); // front
    p.fill(139, 69, 19);
    p.vertex(closetX + 60, closetY - 5); // 4
    p.vertex(closetX + 230, closetY + 5); // 5
    p.vertex(closetX + 230, closetY + 310); // 6
    p.vertex(closetX + 60, closetY + 325); // 3
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 1
    p.fill(139, 69, 19);
    p.strokeWeight(10);
    p.stroke("#4A371A");
    p.vertex(closetX + 70, closetY + 15); // 7
    p.vertex(closetX + 70, closetY + 170); // 8
    p.vertex(closetX + 132, closetY + 168); // 9
    p.vertex(closetX + 132, closetY + 20); // 10
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 2
    p.fill(139, 69, 19);
    p.vertex(closetX + 154, closetY + 22); // 11
    p.vertex(closetX + 154, closetY + 168); // 12
    p.vertex(closetX + 215, closetY + 166); // 13
    p.vertex(closetX + 215, closetY + 25); // 14
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 3
    p.fill(139, 69, 19);
    p.vertex(closetX + 70, closetY + 195); // 15
    p.vertex(closetX + 70, closetY + 304); // 16
    p.vertex(closetX + 132, closetY + 300); // 17
    p.vertex(closetX + 132, closetY + 193); // 18
    p.endShape(p.CLOSE);

    p.beginShape(); // small front 4
    p.fill(139, 69, 19);
    p.vertex(closetX + 154, closetY + 193); // 20
    p.vertex(closetX + 154, closetY + 300); // 21
    p.vertex(closetX + 215, closetY + 295); // 22
    p.vertex(closetX + 215, closetY + 191); // 23
    p.endShape(p.CLOSE);

    p.stroke(0);
    p.strokeWeight(1);
    p.line(closetX + 143, closetY, closetX + 143, closetY + 318);

    p.fill("#5C5030");
    p.ellipse(closetX + 136, closetY + 182, 7, 7);
    p.ellipse(closetX + 154, closetY + 182, 7, 7);

    p.pop();
  }
}
