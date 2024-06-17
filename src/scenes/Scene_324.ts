import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_324 extends BaseScene {
    getPreviousScene(): number { return 323; }

    getNextScene(): number { return 325; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("61", this.drawManager);

        let ropeScale = { x: 0.2, y: 0.2 };
        let oldRope = objectFactory.create("res/images/object/rope_weak.png");
        oldRope.setPosition(p.width / 2, -200);
        oldRope.setScale(ropeScale.x, ropeScale.y);
        this.startAnimation(new MoveAnimation(oldRope, p.width / 2, 200, 2));
        this.drawManager.addDrawable(oldRope);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb_rope);
        tiger.setPosition(p.width / 2 + 10, 435);
        tiger.setScale(0.6, 0.6);
        this.drawManager.addDrawable(tiger);

        this.startAnimation(new MoveAnimation(oldRope, p.width / 2, -200 - 400, 8, EaseType.InOutSine));
        this.startAnimation(new MoveAnimation(tiger, p.width / 2, 420 - 400, 8, EaseType.InOutSine));

        //this.soundManager.playOnce("res/sound/effect/324_호랑이가밧줄잡는소리.mp3");
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.animationManager.update();
        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}