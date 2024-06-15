import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_315 extends BaseScene {
    getPreviousScene(): number { return 314; }

    getNextScene(): number { return 316; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("51", this.drawManager);

        let bronzeRope = objectFactory.create("res/images/character/bronze rope handing.png");
        bronzeRope.setPosition(p.width / 2, 300);
        bronzeRope.setScale(0.3, 0.3);
        this.drawManager.addDrawable(bronzeRope);

        let cloud1 = objectFactory.create("res/images/object/cloud.png");
        cloud1.setPosition(200, 150);
        cloud1.setScale(0.55, 0.55);
        this.drawManager.addDrawable(cloud1);
        let anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 6, 1.5, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        let cloud2 = objectFactory.create("res/images/object/cloud2.png");
        cloud2.setPosition(1000, 80);
        cloud2.setScale(0.4, 0.4);
        this.drawManager.addDrawable(cloud2);
        anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 9, 1.8, EaseType.InOutBack);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        //this.soundManager.playOnce("res/sound/effect/315.325_밧줄투욱끊어지는소리.mp3");
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