import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_314 extends BaseScene {
    getPreviousScene(): number { return 313; }

    getNextScene(): number { return 315; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("51", this.drawManager);

        let bronzeRope = objectFactory.create("res/images/character/bronze rope handing.png");
        bronzeRope.setPosition(p.width / 2, 0);
        bronzeRope.setScale(0.3, 0.3);
        this.drawManager.addDrawable(bronzeRope);
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