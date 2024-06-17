import { BaseAnimation } from "./BaseAnimation";
import type { Drawable } from "./Drawable";
import { easeMethod } from "./EaseMethod";
import { EaseType } from "./EaseType";

export class ScaleAnimation extends BaseAnimation {
    destX: number;
    destY: number;
    private startX: number;
    private startY: number;
    public duration: number;
    private elapsedTime = 0;

    constructor(target: Drawable);
    constructor(target: Drawable, destX: number, destY: number, duration: number);
    constructor(target: Drawable, destX: number, destY: number, duration: number, easeType: EaseType);
    constructor(
        target: Drawable,
        destX?: number,
        destY?: number,
        duration?: number,
        easeType?: EaseType
    ) {
        super(target);
        this.startX = target.getScaleX();
        this.startY = target.getScaleY();
        this.destX = destX || target.getScaleX();
        this.destY = destY || target.getScaleY();
        this.duration = duration || 0;
        let e = easeType ?? EaseType.Linear;
        this.easeType = e;
    }

    update(): void {
        this.elapsedTime += deltaTime;
        let t = this.elapsedTime / this.duration;
        if (t > 1.0) {
            t = 1.0;
            this.isDone = true;
        }

        const currentScaleX = easeMethod.evaluate(
            this.easeType,
            this.startX,
            this.destX,
            t
        );
        const currentScaleY = easeMethod.evaluate(
            this.easeType,
            this.startY,
            this.destY,
            t
        );

        this.target.setScale(currentScaleX, currentScaleY);

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

    reset(): ScaleAnimation {
        this.elapsedTime = 0;
        this.isDone = false;
        this.startX = this.target.getScaleX();
        this.startY = this.target.getScaleY();
        return this;
    }
}
