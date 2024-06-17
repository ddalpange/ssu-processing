import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { loadBackground, objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { ShapeObject } from "../interfaces/ShapeObject";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_323 extends BaseScene {
    thunder1!: ShapeObject;
    thunder2!: ShapeObject;
    timeTracker: TimeTracker = new TimeTracker();

    getPreviousScene(): number { return 322; }

    getNextScene(): number { return 324; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("60", this.drawManager);

        let ropeScale = { x: 0.3, y: 0.3 };
        let oldRope = objectFactory.create("res/images/object/rope_weak.png");
        oldRope.setPosition(p.width / 2, -400);
        oldRope.setScale(ropeScale.x, ropeScale.y);
        this.startAnimation(new MoveAnimation(oldRope, p.width / 2, -100, 2));
        this.drawManager.addDrawable(oldRope);

        this.thunder1 = objectFactory.create("res/images/object/thunder_1.png");
        this.thunder1.setPosition(260, 130);
        this.thunder1.setScale(0.6, 0.6);
        this.drawManager.addDrawable(this.thunder1);
        let anim = new ScaleAnimation(this.thunder1, 0.7, 0.7, 1, EaseType.InOutCubic);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        this.thunder2 = objectFactory.create("res/images/object/thunder_2.png");
        this.thunder2.setPosition(1000, 150);
        this.thunder2.setScale(0.6, 0.6);
        this.drawManager.addDrawable(this.thunder2);
        anim = new ScaleAnimation(this.thunder2, 0.7, 0.7, 1.3, EaseType.InOutCubic);
        anim.repeatCount = -1;
        this.startAnimation(anim);

        //soundManager.playOnce("res/sound/effect/323_천둥소리.mp3");
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.timeTracker.update(deltaTime);
        this.animationManager.update();
        //this.ThunderUpdate();
        p.pop();
    }

    ThunderUpdate(): void {
        if (this.timeTracker.ifTimeIs(1))
            this.startAnimation(new MoveAnimation(this.thunder1, 50, 900, 1));

        if (this.timeTracker.ifTimeIs(2))
            this.startAnimation(new MoveAnimation(this.thunder2, 600, 900, 1));
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}