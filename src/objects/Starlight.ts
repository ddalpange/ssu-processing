import { Drawable } from "../interfaces/Drawable";

export class Starlight extends Drawable {
    numStars: number;
    starX: number[];
    starY: number[];
    starBrightness: number[];
    starBrightnessChange: number[];
    starColor: string[];

    constructor(
        numStars: number,
        starX: number[],
        starY: number[],
        starBrightness: number[],
        starBrightnessChange: number[],
        starColor: string[]
    ) {
        super();
        this.numStars = numStars;
        this.starX = starX;
        this.starY = starY;
        this.starBrightness = starBrightness;
        this.starBrightnessChange = starBrightnessChange;
        this.starColor = starColor;
    }

    draw(): void {
        p.push();
        for (let i = 0; i < this.numStars; i++) {
            // Adjust brightness based on brightness change
            this.starBrightness[i] += this.starBrightnessChange[i];
            if (this.starBrightness[i] > 255 || this.starBrightness[i] < 100) {
                this.starBrightnessChange[i] *= -1; // Reverse brightness change direction
            }
            this.starBrightness[i] = p.constrain(this.starBrightness[i], 100, 255); // Limit brightness range
            // Adjust color based on brightness (gradient from yellow to white)
            this.drawStar(this.starX[i], this.starY[i], this.starBrightness[i]);
        }
        p.pop();
    }

    drawStar(x: number, y: number, brightness: number): void {
        p.stroke(255, 255, 255, brightness);
        p.strokeWeight(2);
        // Cross shape
        p.line(x - 5, y, x + 5, y);
        p.line(x, y - 5, x, y + 5);
        // Diamond shape
        p.line(x - 3.5, y - 3.5, x + 3.5, y + 3.5);
        p.line(x + 3.5, y - 3.5, x - 3.5, y + 3.5);
    }
}
