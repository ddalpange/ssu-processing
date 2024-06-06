import { Drawable } from "../interfaces/Drawable";

export class PointsAndLines extends Drawable {
  private numPoints: number;
  private xList: number[];
  private yList: number[];

  constructor(
    x: number,
    y: number,
    w: number,
    h: number,
    numPoints: number,
    xList: number[],
    yList: number[]
  ) {
    super(x, y, w, h);
    this.numPoints = numPoints;
    this.xList = xList;
    this.yList = yList;
  }

  draw(): void {
    const spacing: number = this.w / 8;

    p.push();

    p.background(255);
    p.stroke(0);
    p.fill(0);

    for (let i = 0; i < this.numPoints - 1; i++) {
      p.ellipse(this.x + this.xList[i], this.y + this.yList[i], 5, 5);
      p.strokeWeight(1);
      p.line(
        this.x + this.xList[i],
        this.y + this.yList[i],
        this.x + this.xList[i + 1],
        this.y + this.yList[i + 1]
      );
    }

    p.ellipse(
      this.x + this.xList[this.numPoints - 1],
      this.y + this.yList[this.numPoints - 1],
      5,
      5
    );
    p.strokeWeight(5);
    p.line(
      this.x + this.xList[0],
      this.y + (this.yList[1] + this.yList[2]) / 2,
      this.x + this.xList[this.xList.length - 1],
      this.y + this.yList[this.yList.length - 1]
    );
    p.stroke(255, 0, 0);
    p.strokeWeight(4);
    p.line(
      this.x + this.xList[0],
      this.y + (this.yList[1] + this.yList[2]) / 2 - 3,
      this.x + this.xList[this.xList.length - 1],
      this.y + this.yList[this.yList.length - 1] - 3
    );

    p.pop();
  }
}
