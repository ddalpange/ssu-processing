import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { ShapeObject } from "../interfaces/ShapeObject";
import { SpriteAnimation } from "../interfaces/SpriteAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_304 extends BaseScene {
    getPreviousScene(): number { return 303; }
    getNextScene(): number { return 305; }

    outDuration = 0.7;
    waitDuration = 2.5;
    jumpHeight = 20;
    jumpDuration = 1;
    divideValue = 5;
    verticalMoveSize = 10;

    tiger!: SpriteAnimation;
    outMoveAnimation!: MoveAnimation;
    outScaleUpAnimation!: ScaleAnimation;

    textBubble!: ShapeObject;

    timeTracker = new TimeTracker();

    waitStartTime = 0;
    curCount = 0;
    jumpStartTime = 0;
    ableToJump = false;

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("41", this.drawManager);

        this.tiger = objectFactory.createAnimation(CharacterType.tiger_mom, "front", 5)!;
        this.tiger.playInfinite(1.5);
        this.tiger.setPosition(300, 200);
        this.tiger.setScale(0.3, 0.3);
        this.drawManager.addDrawable(this.tiger);

        this.outMoveAnimation = new MoveAnimation(this.tiger, 720, 560, this.outDuration, EaseType.InOutCirc);
        this.outScaleUpAnimation = new ScaleAnimation(this.tiger, 0.8, 0.8, this.outDuration);
        //this.soundManager.playOnce("res/sound/effect/301.302.304_뛰는발걸음소리.mp3");

        this.textBubble = objectFactory.create("res/images/ui/red question.png");
        this.textBubble.setPosition(0, 0);
        this.textBubble.setScale(0.8, 0.8);
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.animationManager.update();
        this.timeTracker.update(deltaTime);
        this.MoveUpdate();
        this.uiManager.drawing();

        p.pop();
    }

    MoveUpdate(): void {
        if (this.timeTracker.ifTimeIs(this.waitDuration)) {
            this.startAnimation(this.outMoveAnimation);
            this.startAnimation(this.outScaleUpAnimation);
        }

        if (this.timeTracker.ifTimeIs(this.waitDuration + this.outDuration)) {
            this.jumpStartTime = this.timeTracker.getCurrentTime();
            this.ableToJump = true;
        }

        if (this.ableToJump)
            this.Jump(this.jumpHeight, this.jumpDuration);
    }

    Jump(height: number, duration: number): void {
        let jumpTargetTime = duration / this.divideValue * this.curCount + this.jumpStartTime;

        this.tiger.setPosition(720 + (this.curCount / 5 % 2 == 0 ? -this.verticalMoveSize : this.verticalMoveSize), this.tiger.getY());

        if (this.timeTracker.ifTimeOver(jumpTargetTime)) {
            if (this.curCount % this.divideValue == 0) {
                this.startAnimation(new MoveAnimation(this.tiger, this.tiger.getX(), this.tiger.getY() - height, duration / this.divideValue));
            }
            if (this.curCount % this.divideValue == 1) {
                this.startAnimation(new MoveAnimation(this.tiger, this.tiger.getX(), this.tiger.getY() + height, duration / this.divideValue));
            }

            if (this.curCount % 3 == 0)
                this.textBubble.setPosition(Math.random() * (900 - 500) + 500, Math.random() * (500 - 150) + 150);

            this.curCount++;
        }

        this.textBubble.draw();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}