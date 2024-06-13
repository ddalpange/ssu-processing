import p5 from 'p5';
import { Drawable } from './Drawable';
import { PVector } from './PVector';

export class SpriteAnimation extends Drawable {
    private images: p5.Image[];
    private cycleSeconds!: number;
    private frameSeconds!: number;
    private timeElapsed!: number;
    private currentFrame!: number;
    private nTimes!: number;
    private nTimesPlayed!: number;
    private manualMode!: boolean;

    constructor(images: p5.Image[]) {
        super();
        this.images = images;
        this.scale = new PVector(1, 1);
    }

    public playNTimes(cycleSeconds: number, n: number) {
        this.cycleSeconds = cycleSeconds;
        this.frameSeconds = cycleSeconds / this.images.length;
        this.nTimes = n;
        this.timeElapsed = 0;
        this.currentFrame = 0;
        this.nTimesPlayed = 0;
    }

    public playInfinite(cycleSeconds: number) {
        this.cycleSeconds = cycleSeconds;
        this.frameSeconds = cycleSeconds / this.images.length;
        this.nTimes = -1;
        this.timeElapsed = 0;
        this.currentFrame = 0;
        this.nTimesPlayed = 0;
    }

    public draw() {
        //console.log("sprite animation draw");
        p.push();
        p.translate(this.x, this.y);
        p.rotate(p.radians(this.zAngle));

        let image: p5.Image | null = null;
        if (this.manualMode) {
            image = this.getManualMode();
        } else {
            image = this.updateAutomaticMode();
        }

        if (image === null) {
            console.log("image is null");
        } else {
            this.setup(this.x, this.y, image.width, image.height, this.zIndex);
            this.setScale(this.scale.x, this.scale.y); // for update w, h

            if (this.scale.x < 0) {
                p.push();
                p.translate(this.x * p.abs(this.scale.x), this.y * p.abs(this.scale.y));
                p.scale(this.scale.x, this.scale.y);
                p.image(image, 0, 0, this.w, this.h);
                p.pop();
            } else {
                //console.log(image + " , " + this.x, " , " + this.y + ", " + this.w, " , " + this.h);
                p.image(image, this.x, this.y, this.w, this.h);
            }
        }

        p.pop();
    }

    private updateAutomaticMode() {
        let image: p5.Image | null = null;
        if (this.nTimes < 0 || this.nTimesPlayed < this.nTimes) {
            image = this.images[this.currentFrame];

            this.timeElapsed += deltaTime;
            if (this.timeElapsed > this.frameSeconds) {
                this.timeElapsed = 0;
                this.nextFrame();
            }
        }
        else {
            // draw last frame
            image = this.images[this.images.length - 1];
        }

        return image;
    }

    private getManualMode() {
        return this.images[this.currentFrame];
    }

    public nextFrame() {
        this.currentFrame++;
        if (this.currentFrame >= this.images.length) {
            this.currentFrame = 0;
            this.nTimesPlayed++;
        }
    }
}