import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_319 extends BaseScene {
    getPreviousScene(): number { return 318; }

    getNextScene(): number { return 320; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("56", this.drawManager);

        let goldRope = objectFactory.create("res/images/character/gold rope handing.png");
        goldRope.setPosition(p.width / 2, 0);
        goldRope.setScale(0.35, 0.35);
        this.drawManager.addDrawable(goldRope);

        //this.soundManager.playOnce("res/sound/effect/314.319_밧줄잡는소리.mp3");
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}