import { Drawable } from "./Drawable";

export class DrawManager {
    public drawables: Drawable[] = [];

    public addDrawable(drawable: Drawable) {
        this.drawables.push(drawable);
        // sort by drawable zIndex
        this.drawables.sort((o1, o2) => o1.zIndex - o2.zIndex);
    }

    public removeDrawable(drawable: Drawable) {
        this.drawables = this.drawables.filter((v) => v === drawable);
    }

    public drawing() {
        for (const v of this.drawables) {
            v.draw();
        }
    }

    public mousePressed() {
        // for (const v of this.drawables) {
        //   v.mousePressed();
        // }
    }
}
