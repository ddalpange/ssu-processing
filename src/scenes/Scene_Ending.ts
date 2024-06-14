import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";
import { sceneManager } from "../interfaces/SceneManager";
import { Scene_Intro_New } from "./Scene_Intro_New";

export class Scene_Ending extends BaseScene {
    getNextScene(): number { return -1; }
    public getPreviousScene(): number {
        return 330;
    }

    private defaultImageHeight: number = 1055;
    private scaleMultiple: number = 3;
    private heightBuffer: number = 650;
    private moveSpeed: number = 2;
    private moveSpeedMultiple: number = 3;
    private curHeight: number = 0;
    private endHeight: number = 0;
    private isEnd: boolean = false;
    private endingBox: any; // Replace with the actual type
    private isMousePressing: boolean = false;

    setup(): void {
        console.log("Scene_Ending : setup");
        loadBackground("59", this.drawManager);
        this.curHeight = -this.defaultImageHeight * this.scaleMultiple / 2 + this.heightBuffer;
        this.endHeight = this.defaultImageHeight * this.scaleMultiple / 2;

        this.endingBox = objectFactory.create("res/images/ui/ending_box2.png");
        this.endingBox.setPosition(p.width / 2, this.curHeight);
        this.endingBox.setScale(0.8, 0.8);
        this.drawManager.addDrawable(this.endingBox);

        let endingHead = objectFactory.create("res/images/ui/ending_box.png");
        endingHead.setPosition(p.width / 2, 60);
        endingHead.setScale(0.8, 0.8);
        this.drawManager.addDrawable(endingHead);

        this.isEnd = false;
    }

    draw(): void {
        p.push();

        p.background(255, 255, 255);
        this.drawManager.drawing();
        this.mouseUpdate();
        this.scrollUpdate();

        p.pop();
    }

    private mouseUpdate(): void {
        this.isMousePressing = p.mouseIsPressed;
    }

    private scrollUpdate(): void {
        if (this.isEnd)
            return;

        this.curHeight += this.isMousePressing ? this.moveSpeed * this.moveSpeedMultiple : this.moveSpeed;
        this.endingBox.setPosition(p.width / 2, this.curHeight);

        let isOver = this.curHeight >= this.endHeight;
        if (isOver && !this.isEnd) {
            sceneManager.loadScene(new Scene_Intro_New());
            this.isEnd = true;
        }
    }
}