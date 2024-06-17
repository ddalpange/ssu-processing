import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_327 extends BaseScene {
    getPreviousScene(): number { return 326; }

    getNextScene(): number { return 328; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("64", this.drawManager);

        let goldRope = objectFactory.create("res/images/character/gold_rope_hanging_night.png");
        goldRope.setPosition(100, 100);
        goldRope.setScale(0.1, 0.1);
        this.drawManager.addDrawable(goldRope);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.fall);
        tiger.setPosition(500, 200);
        tiger.setScale(0.2, 0.2);
        this.drawManager.addDrawable(tiger);

        this.startAnimation(new MoveAnimation(tiger, 500, 600, 10, EaseType.OutCubic));
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