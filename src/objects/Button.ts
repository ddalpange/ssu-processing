import p5 from "p5";
import { PVector } from "../interfaces/PVector";

export class Button {
    text!: string;
    buttonColor: string = '#ffffff'
    textColor: string = '#000000'
    fontSize: number = 24;
    public position: PVector;
    size: PVector;
    image!: p5.Image;
    mouseClickedThisFrame!: boolean;

    constructor();
    constructor(text: string, position: PVector, size: PVector);
    constructor(position: PVector, size: PVector, image: p5.Image);
    constructor(textOrPosition?: string | PVector, positionOrSize?: PVector, sizeOrImage?: PVector | p5.Image) {
        if (typeof textOrPosition === 'string') {
            this.text = textOrPosition;
            this.position = positionOrSize!;
            this.size = sizeOrImage as PVector;
        } else {
            this.position = textOrPosition!;
            this.size = positionOrSize!;
            this.image = sizeOrImage as p5.Image;
        }
    }

    drawAndCheckClick(): boolean {
        p.push();

        this.draw();

        p.pop();

        return this.isMouseOver() && this.mouseClickedThisFrame;
    }

    isMouseOver(): boolean {
        let posX = this.position.x;
        let posY = this.position.y;
        let sizeX = this.size ? this.size.x : this.image.width;
        let sizeY = this.size ? this.size.y : this.image.height;
        if (this.image) {
            posX -= sizeX / 2;
            posY -= sizeY / 2;
        }
        return p.mouseX > posX && p.mouseX < posX + sizeX && p.mouseY > posY && p.mouseY < posY + sizeY;
    }

    draw(): void {
        p.push();

        p.noStroke();
        let fontSize = this.getMouseOverFontSize(this.isMouseOver());
        p.fill(this.buttonColor);
        let sizeX = this.size ? this.size.x : this.image.width;
        let sizeY = this.size ? this.size.y : this.image.height;
        if (this.image) {
            p.imageMode(p.CENTER);
            p.image(this.image, this.position.x - sizeX / 2, this.position.y - sizeY / 2, sizeX, sizeY);
        } else {
            p.rect(this.position.x, this.position.y, this.size.x, this.size.y);
        }
        if (this.text) {
            let textX;
            let textY;
            if (this.image) {
                textX = this.position.x;
                textY = this.position.y;
            } else {
                textX = this.position.x + sizeX / 2;
                textY = this.position.y + sizeY / 2;
            }
            p.textAlign(p.CENTER, p.CENTER);
            p.text(this.text, textX, textY, fontSize);
        }
        p.pop();
    }

    setMouseOverStyle(isOver: boolean): void {
        if (isOver) {
            p.strokeWeight(2);
        }
        else {
            p.strokeWeight(1);
        }
    }

    getMouseOverFontSize(isOver: boolean): number {
        if (isOver) {
            return this.fontSize * 1.2;
        }
        else {
            return this.fontSize;
        }
    }
}