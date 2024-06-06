import { Drawable } from "../interfaces/Drawable";

export class Candle extends Drawable {
  constructor(x: number, y: number) {
    super(x, y, 100, 100);
  }

  draw(): void {
    const lightX = this.x;
    const lightY = this.y;
    const lightW = 30;
    const lightH = 75;

    p.push();

    //초 본체
    p.beginShape();
    p.fill(255);
    p.noStroke();
    p.vertex(lightX, lightY); //꼭짓점
    p.bezierVertex(
      lightX,
      lightY,
      lightX + lightW / 2,
      lightY + 20,
      lightX + lightW,
      lightY
    );
    p.vertex(lightX + lightW, lightY); //꼭짓점
    p.vertex(lightX + lightW, lightY + lightH); //꼭짓점
    p.vertex(lightX, lightY + lightH); //꼭짓점
    p.endShape();
    p.push();
    p.fill(p.color(254, 235, 207));
    p.ellipse(lightX + lightW / 2, lightY, lightW, 20);
    p.pop();

    //촛불
    p.beginShape();
    p.fill(p.color(203, 37, 36)); //빨간 불꽃
    p.vertex(lightX + lightW / 2, lightY);
    p.bezierVertex(
      lightX + lightW / 2,
      lightY,
      lightX - (lightW / 3) * 2,
      lightY - ((lightH / 3) * 2) / 2,
      lightX + lightW / 2,
      lightY - (lightH / 3) * 2
    );
    p.vertex(lightX + lightW / 2, lightY - (lightH / 3) * 2);
    p.bezierVertex(
      lightX + lightW / 2,
      lightY - (lightH / 3) * 2,
      lightX + lightW + (lightW / 3) * 2,
      lightY - ((lightH / 3) * 2) / 2,
      lightX + lightW / 2,
      lightY
    );
    p.vertex(lightX + lightW / 2, lightY);
    p.endShape();

    p.beginShape();
    p.fill(p.color(255, 173, 92)); //주황 불꽃
    p.vertex(lightX + lightW / 2, lightY);
    p.bezierVertex(
      lightX + lightW / 2,
      lightY,
      lightX - lightW / 4,
      lightY - lightH / 3,
      lightX + lightW / 2,
      lightY - lightH / 2
    );
    p.vertex(lightX + lightW / 2, lightY - lightH / 2);
    p.bezierVertex(
      lightX + lightW / 2,
      lightY - lightH / 2,
      lightX + lightW + lightW / 4,
      lightY - lightH / 3,
      lightX + lightW / 2,
      lightY
    );
    p.vertex(lightX + lightW / 2, lightY);
    p.endShape();

    p.beginShape();
    p.fill(p.color(255, 255, 157)); //노랑 불꽃
    p.vertex(lightX + lightW / 2, lightY);
    p.bezierVertex(
      lightX + lightW / 2,
      lightY,
      lightX + lightW / 6,
      lightY - lightH / 3,
      lightX + lightW / 2,
      lightY - lightH / 3 - lightH / 15
    );
    p.vertex(lightX + lightW / 2, lightY - lightH / 3 - lightH / 15);
    p.bezierVertex(
      lightX + lightW / 2,
      lightY - lightH / 3 - lightH / 15,
      lightX + lightW - lightW / 6,
      lightY - lightH / 3,
      lightX + lightW / 2,
      lightY
    );
    p.vertex(lightX + lightW / 2, lightY);
    p.endShape();

    p.pop();
  }
}
