import p5 from "p5";
import { Drawable } from "./Drawable";

export class ShapeObject extends Drawable {
  protected image: p5.Image | undefined;

  constructor(imageSrc: string) {
    super();
    this.scale = new p5.Vector();
    p.loadImage(imageSrc, (image) => {
      this.image = image;
      this.initialW = image.width;
      this.w = image.width;
      this.initialH = image.height;
      this.h = image.height;
    });
  }

  draw(): void {
    this.drawImage();
  }

  private drawImage(): void {
    if (this.image == null) return;
    p.push();

    p.imageMode(p.CENTER);
    p.rotate(this.zAngle);

    if (this.scale.x < 0) {
      p.push();
      p.translate(this.x, this.y);
      p.scale(-1, 1);
      p.image(this.image, 0, 0, this.w, this.h);
      p.pop();
    } else {
      p.image(this.image, this.x, this.y, this.w, this.h);
    }
    p.pop();
  }
}
