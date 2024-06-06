import { Drawable } from "../interfaces/Drawable";

export class OpenDoor extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    const x1 = 150 + 5 + this.x;
    const y1 = -250 + 1 + this.y;
    const x2 = 300 + 5 + this.x;
    const y2 = -190 + 1 + this.y;
    const x3 = 300 + 5 + this.x;
    const y3 = 310 + 1 + this.y;
    const x4 = 150 + 5 + this.x;
    const y4 = 250 + 1 + this.y;

    p.push();
    // translate(x, y);
    this.drawDoorBackground(x1, y1, x2, y2, x3, y3, x4, y4);
    this.drawFrame(this.x, this.y);
    this.drawInside(this.x, this.y);
    this.drawOpenDoor(x1, y1, x2, y2, x3, y3, x4, y4, 6);
    p.pop();
  }

  private drawFrame(x: number, y: number): void {
    p.push();
    p.stroke("#964b00");
    p.strokeWeight(6);
    p.noFill();
    p.rectMode(p.CENTER);
    p.rect(x, y, 300, 500);
    p.pop();
  }

  private drawOpenDoor(
    x1: number,
    y1: number,
    x2: number,
    y2: number,
    x3: number,
    y3: number,
    x4: number,
    y4: number,
    numDiv: number
  ): void {
    p.push();
    p.stroke("#b4773b");
    p.strokeWeight(4);
    for (let i = 1; i < numDiv; i++) {
      const xLerp1 = p.lerp(x1, x4, i / numDiv);
      const yLerp1 = p.lerp(y1, y4, i / numDiv);
      const xLerp2 = p.lerp(x2, x3, i / numDiv);
      const yLerp2 = p.lerp(y2, y3, i / numDiv);
      p.line(xLerp1, yLerp1, xLerp2, yLerp2);
    }
    for (let i = 1; i < numDiv; i++) {
      const xLerp1 = p.lerp(x1, x2, i / numDiv);
      const yLerp1 = p.lerp(y1, y2, i / numDiv);
      const xLerp2 = p.lerp(x4, x3, i / numDiv);
      const yLerp2 = p.lerp(y4, y3, i / numDiv);
      p.line(xLerp1, yLerp1, xLerp2, yLerp2);
    }
    p.stroke("#964b00");
    p.strokeWeight(2);
    p.beginShape();
    p.strokeWeight(6);
    p.vertex(x1, y1);
    p.vertex(x2, y2);
    p.vertex(x3, y3);
    p.vertex(x4, y4);
    p.endShape(p.CLOSE);
    p.fill("#eeeeee");
    p.strokeWeight(6);
    p.stroke("#964b00");
    p.ellipse(x1 + 125, (y1 + y4 + 115) / 2, 20, 20);
    p.pop();
  }

  private drawDoorBackground(
    x1: number,
    y1: number,
    x2: number,
    y2: number,
    x3: number,
    y3: number,
    x4: number,
    y4: number
  ): void {
    p.push();
    p.beginShape();
    p.fill("#eeeeee");
    p.vertex(x1, y1);
    p.vertex(x2, y2);
    p.vertex(x3, y3);
    p.vertex(x4, y4);
    p.endShape(p.CLOSE);
    p.pop();
  }

  private drawInside(x: number, y: number): void {
    p.noFill();
    p.stroke("#b4773b");
    p.strokeWeight(8);
    p.rectMode(p.CENTER);
    p.rect(x, y, 290, 490);
  }
}
