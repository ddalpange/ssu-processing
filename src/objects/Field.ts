import { Drawable } from "../interfaces/Drawable";

export class Field extends Drawable {
  suSuX: number[];
  suSuheight: number[];
  suSuLeafLength: number[][];
  suSuLeafAngle: number[][];
  suSuLeafY: number[][];

  constructor() {
    super(0, 0, 100, 100);

    this.suSuX = new Array(50);
    this.suSuheight = new Array(50);
    this.suSuLeafLength = new Array(50);
    this.suSuLeafAngle = new Array(50);
    this.suSuLeafY = new Array(50);

    for (let i = 0; i < 50; i++) {
      this.suSuX[i] = p.random(p.width);
      this.suSuheight[i] = p.random(100, 150);
      this.suSuLeafLength[i] = new Array(5);
      this.suSuLeafAngle[i] = new Array(5);
      this.suSuLeafY[i] = new Array(5);
      for (let j = 0; j < 5; j++) {
        this.suSuLeafLength[i][j] = p.random(30, 50);
        this.suSuLeafAngle[i][j] = p.random(-Math.PI / 4, Math.PI / 4);
        this.suSuLeafY[i][j] = p.random(
          this.suSuheight[i] * 0.2,
          this.suSuheight[i] * 0.8
        );
      }
    }
  }

  draw() {
    p.push();

    this.drawHills();
    this.drawSuSuField();

    p.pop();
  }

  drawHills() {
    p.noStroke();

    p.fill(154, 210, 142);
    p.rect(0, p.height * 0.75, p.width, p.height * 0.25);

    p.fill(134, 100, 10);
    p.rect(0, p.height * 0.74, p.width, p.height * 0.05);

    p.fill(60, 179, 113);
    p.beginShape();
    p.vertex(0, p.height * 0.75);
    p.vertex(p.width, p.height * 0.75);
    p.vertex(p.width, p.height * 0.55);
    p.vertex(0, p.height * 0.65);
    p.endShape(p.CLOSE);

    p.fill(34, 139, 34);
    p.beginShape();
    p.vertex(0, p.height * 0.65);
    p.vertex(p.width, p.height * 0.55);
    p.vertex(p.width, p.height * 0.35);
    p.vertex(0, p.height * 0.45);
    p.endShape(p.CLOSE);

    p.fill(0, 128, 0);
    p.beginShape();
    p.vertex(0, p.height * 0.45);
    p.vertex(p.width, p.height * 0.35);
    p.vertex(p.width, p.height * 0.15);
    p.vertex(0, p.height * 0.25);
    p.endShape(p.CLOSE);
  }

  drawSuSuField() {
    for (let i = 0; i < 50; i++) {
      this.drawSuSu(this.suSuX[i], p.height * 0.75, this.suSuheight[i], i);
    }
  }

  drawSuSu(x: number, y: number, height: number, index: number) {
    p.stroke(85, 107, 47);
    p.strokeWeight(4);
    p.line(x, y, x, y - p.height);

    for (let i = 0; i < 5; i++) {
      this.drawSuSuLeaf(
        x,
        y - this.suSuLeafY[index][i],
        this.suSuLeafLength[index][i],
        this.suSuLeafAngle[index][i]
      );
    }

    this.drawSuSuFlower(x, y - p.height, 20);
  }

  drawSuSuLeaf(x: number, y: number, length: number, angle: number) {
    p.push();
    p.translate(x, y);
    p.rotate(angle);
    p.stroke(34, 139, 34); // 짙은 녹색
    p.line(0, 0, length, 0);
    p.pop();
  }

  drawSuSuFlower(x: number, y: number, size: number) {
    p.fill(255, 215, 0); // 황금색
    p.noStroke();
    p.ellipse(x, y, size, size * 1.5);
  }
}
