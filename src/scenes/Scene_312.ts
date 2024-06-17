import { BaseScene } from "../interfaces/BaseScene";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_312 extends BaseScene {
    getPreviousScene(): number { return 311; }

    getNextScene(): number { return 313; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("49", this.drawManager);

        let ropeScale = { x: 0.1, y: 0.1 };
        let newRope = objectFactory.create("res/images/object/rope_strong.png");
        newRope.setPosition(350, 0);
        newRope.setScale(ropeScale.x, ropeScale.y);
        this.startAnimation(new MoveAnimation(newRope, 350, 200, 2));
        this.drawManager.addDrawable(newRope);

        let oldRope = objectFactory.create("res/images/object/rope_weak.png");
        oldRope.setPosition(p.width - 350, -100);
        oldRope.setScale(ropeScale.x, ropeScale.y);
        this.startAnimation(new MoveAnimation(oldRope, p.width - 350, 170, 2));
        this.drawManager.addDrawable(oldRope);

        // TODO: Add cloud and rope falling effect

        //this.soundManager.playOnce("res/sound/effect/312_따라란효과음.mp3");
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