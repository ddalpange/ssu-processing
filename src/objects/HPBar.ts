import { Drawable } from "../interfaces/Drawable";

export class HPBar extends Drawable {
    public hp: number = 0;
    public maxHp: number = 10;
    private borderWidth: number = 4;

    constructor(x: number, y: number) {
        super(x, y, 300, 100);
    }

    public draw(): void {
        let abstractX: number = this.x;
        let abstractY: number = this.y;

        // Border
        p.push();
        p.stroke("#DD9A5E");
        p.strokeWeight(this.borderWidth);
        p.translate(abstractX, abstractY);
        p.rotate(p.radians(this.zAngle));
        p.rect(0, 0, this.w, this.h);
        p.pop();

        // HP Bar
        p.push();
        p.noStroke();
        p.fill(200, 0, 0);
        p.strokeWeight(2);
        p.translate(abstractX, abstractY);
        p.rotate(p.radians(this.zAngle));
        let buffer: number = this.borderWidth / 2;
        p.rect(buffer, buffer, this.w * this.hp / this.maxHp - buffer, this.h - buffer);
        p.pop();
    }
}
