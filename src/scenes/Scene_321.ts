import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_321 extends BaseScene {
    getPreviousScene(): number { return 320; }

    getNextScene(): number { return 322; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("58", this.drawManager);

        let goldRope = objectFactory.create("res/images/character/gold rope handing.png");
        goldRope.setPosition(400, 120);
        goldRope.setScale(0.09, 0.09);
        this.drawManager.addDrawable(goldRope);

        let cloud1 = objectFactory.create("res/images/object/cloud.png");
        cloud1.setPosition(200, 150);
        cloud1.setScale(0.45, 0.45);
        this.drawManager.addDrawable(cloud1);
        let anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 6, 1.5, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        let cloud2 = objectFactory.create("res/images/object/cloud2.png");
        cloud2.setPosition(900, 70);
        cloud2.setScale(0.3, 0.3);
        this.drawManager.addDrawable(cloud2);
        anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 9, 1.8, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.pray);
        tiger.setPosition(580, 390);
        tiger.setScale(0.3, 0.3);
        this.drawManager.addDrawable(tiger);
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