import { BaseAnimation } from "./BaseAnimation";
import type { Drawable } from "./Drawable";
import { easeMethod } from "./EaseMethod";

export class MoveAnimation extends BaseAnimation {
  destX: number;
  destY: number;
  private startX: number;
  private startY: number;
  public duration: number;
  private elapsedTime = 0;

  constructor(target: Drawable);
  constructor(target: Drawable, destX: number, destY: number, duration: number);
  constructor(
    target: Drawable,
    destX?: number,
    destY?: number,
    duration?: number
  ) {
    console.log("debug1", {});

    super(target);
    this.startX = target.getX();
    this.startY = target.getY();
    this.destX = destX || target.getX();
    this.destY = destY || target.getY();
    this.duration = duration || 0;
    console.log("debug2", {});
  }

  update(): void {
    this.elapsedTime += deltaTime;
    let t = this.elapsedTime / this.duration;
    if (t > 1.0) {
      t = 1.0;
      this.isDone = true;
    }

    const currentX = easeMethod.evaluate(
      this.easeType,
      this.startX,
      this.destX,
      t
    );
    const currentY = easeMethod.evaluate(
      this.easeType,
      this.startY,
      this.destY,
      t
    );

    this.target.setPosition(Math.floor(currentX), Math.floor(currentY));

    if (this.isDone && this.repeatCount !== 0) {
      if (this.reverse) {
        if (this.repeatCount !== 0) {
          this.repeatCount--;
          if (this.repeatCount === 0) {
            return;
          }
        }
      }

      this.reverse = !this.reverse;

      let temp = this.startX;
      this.startX = this.destX;
      this.destX = temp;

      temp = this.startY;
      this.startY = this.destY;
      this.destY = temp;
      this.isDone = false;
      this.elapsedTime = 0;
    }
  }

  reset(): MoveAnimation {
    this.elapsedTime = 0;
    this.isDone = false;
    this.startX = this.target.getX();
    this.startY = this.target.getY();
    return this;
  }
}
