import p5 from "p5";
import { Drawable } from "./Drawable";
import { PVector } from "./PVector";

export class ShapeObject extends Drawable {
    public image: p5.Image | undefined;
    public imageSrc: string | undefined;

    constructor(imageSrc: string) {
        super();
        this.imageSrc = imageSrc;
        this.scale = new PVector(1, 1);
        let retryCount = 0;
        const maxRetries = 10;

        const onSuccess = (image: p5.Image) => {
            //console.log("debug 성공", { imageSrc });
            console.log("이미지 로드 성공 : " + imageSrc);

            this.image = image;
            this.initialW = image.width;
            this.initialH = image.height;
            this.setScale(this.getScaleX(), this.getScaleY());
            //console.log("이미지 scale : " + this.getScaleX() + ',' + this.getScaleY());
            //console.log("이미지 w,h : " + this.w + ',' + this.h);
            //console.log("이미지 w,h2 : " + image.width + ',' + image.height);
        };

        const onFail = () => {
            if (retryCount < maxRetries) {
                retryCount++;
                p.loadImage(imageSrc, onSuccess, onFail);
            } else {
                console.error(`Failed to load image after ${maxRetries} attempts.`);
            }
        };

        p.loadImage(imageSrc, onSuccess, onFail);
    }

    draw(): void {
        //console.log("debug", { image: this.image });

        if (this.image == null) {
            console.error(`이미지가 초기화되지 않았어요. ${this.imageSrc}`);
            return;
        }
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
