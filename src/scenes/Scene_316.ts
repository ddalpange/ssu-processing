import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";
import { ShapeObject } from "../interfaces/ShapeObject";

export class Scene_316 extends BaseScene {
    private effect!: ShapeObject;
    private clickCount: number = 0;

    getPreviousScene(): number { return 315; }

    getNextScene(): number { return 317; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("53-1", this.drawManager);

        this.effect = objectFactory.create("res/images/object/fluff.png");
        this.effect.setPosition(p.width / 2, p.height / 2);
        this.effect.setScale(1, 1);

        //this.soundManager.playOnce("res/sound/effect/316.326_밧줄툭끊어지는소리.mp3");
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed(): void {
        if (this.clickCount == 0) {
            loadBackground("53-2", this.drawManager);
            this.clickCount++;
            this.uiManager.dialogUi.next();
            this.effect.draw();

            this.drawManager.addDrawable(this.effect);
            return;
        }

        if (this.clickCount == 1) {
            loadBackground("53-3", this.drawManager);
            this.clickCount++;

            this.drawManager.removeDrawable(this.effect);
            this.effect.setScale(1.3, 1.3);
            this.drawManager.addDrawable(this.effect);
            return;
        }
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}