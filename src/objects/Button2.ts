import PImage from 'p5';
import { FontManager, fontManager } from '../interfaces/FontManager';
import { ShapeObject } from '../interfaces/ShapeObject';
import { PVector } from '../interfaces/PVector';

export class Button2 extends ShapeObject {
    text!: string;
    textOffset!: PVector;
    fontSize: number = 24;
    fontColor: string = '#000000';

    mouseOverImage!: PImage.Image | undefined;
    fontManager!: FontManager; // Assuming FontManager is a class

    constructor(imageSrc: string, x: number, y: number, text?: string, fontSize?: number) {
        super(imageSrc);
        this.setPosition(x, y);
        if (text !== undefined) {
            this.text = text;
        }
        if (fontSize !== undefined) {
            this.fontSize = fontSize;
        }
    }

    isClicked(): boolean {
        return this.isMouseOver() && mouseClickedThisFrame;
    }

    draw(): void {
        if (this.mouseOverImage !== null && this.mouseOverImage !== undefined && this.isMouseOver()) {
            let temp = this.image;
            this.image = this.mouseOverImage;
            super.draw();
            this.image = temp;
        } else {
            super.draw();
        }

        p.push();

        if (this.text !== null) {
            let textX = this.x;
            if (this.textOffset !== null && this.textOffset !== undefined)
                textX += this.textOffset.x;
            let textY = this.y;
            if (this.textOffset !== null && this.textOffset !== undefined)
                textY += this.textOffset.y;
            p.textAlign(p.CENTER, p.CENTER);
            fontManager.drawText3(this.text, Math.round(textX), Math.round(textY), this.fontSize, this.fontColor);
        }

        p.pop();
    }
}