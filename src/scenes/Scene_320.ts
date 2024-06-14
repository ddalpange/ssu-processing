import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_320 extends BaseScene {
    getPreviousScene(): number { return 319; }

    getNextScene(): number { return 321; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("57", this.drawManager);

        let cloud1 = objectFactory.create("res/images/object/cloud.png");
        cloud1.setPosition(150, 100);
        cloud1.setScale(0.25, 0.25);
        this.drawManager.addDrawable(cloud1);
        let anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 2, 1.5, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        let cloud2 = objectFactory.create("res/images/object/cloud2.png");
        cloud2.setPosition(500, 80);
        cloud2.setScale(0.2, 0.2);
        this.drawManager.addDrawable(cloud2);
        anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 3, 1.8, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        cloud1 = objectFactory.create("res/images/object/cloud.png");
        cloud1.setPosition(750, 130);
        cloud1.setScale(0.25, 0.25);
        this.drawManager.addDrawable(cloud1);
        anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 2, 1.5, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        let goldRope = objectFactory.create("res/images/character/gold rope handing.png");
        goldRope.setPosition(260, 200);
        goldRope.setScale(0.12, 0.12);
        this.drawManager.addDrawable(goldRope);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb);
        tiger.setPosition(1200, 400);
        tiger.setScale(0.3, 0.3);
        this.drawManager.addDrawable(tiger);

        this.startAnimation(new MoveAnimation(goldRope, 260, 110 - 300, 16, EaseType.OutCirc));
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