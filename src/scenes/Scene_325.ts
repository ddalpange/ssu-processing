import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_325 extends BaseScene {
    getPreviousScene(): number { return 324; }

    getNextScene(): number { return 326; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("62", this.drawManager);

        let goldRope = objectFactory.create("res/images/character/gold rope handing.png");
        goldRope.setPosition(400, 100);
        goldRope.setScale(0.2, 0.2);
        this.drawManager.addDrawable(goldRope);

        let oldRope = objectFactory.create("res/images/object/rope_weak.png");
        oldRope.setPosition(850, -50);
        oldRope.setScale(0.1, 0.1);
        this.drawManager.addDrawable(oldRope);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb_rope);
        tiger.setPosition(855, 320);
        tiger.setScale(0.4, 0.4);
        this.drawManager.addDrawable(tiger);

        //this.soundManager.playOnce("res/sound/effect/315.325_밧줄투욱끊어지는소리.mp3");
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