import { BaseScene } from "../interfaces/BaseScene";
import { DrawManager } from "../interfaces/DrawManager";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ShapeObject } from "../interfaces/ShapeObject";
import { SpriteAnimation } from "../interfaces/SpriteAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_301 extends BaseScene {
    private tiger!: ShapeObject;
    private boy!: SpriteAnimation;
    private girl!: SpriteAnimation;

    private animationDuration: number = 1;
    private animationDelay: number = 1.05;
    private targetTime: number = 0;

    private timeTracker: TimeTracker = new TimeTracker();

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("38", this.drawManager);

        this.tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.angry);
        this.tiger.setPosition(300, 200);
        this.tiger.setScale(0.15, 0.15);
        this.drawManager.addDrawable(this.tiger);

        this.boy = objectFactory.createAnimation(CharacterType.boy, "run", 3)!;
        this.boy.playInfinite(1);
        this.boy.setPosition(700, 500);
        this.boy.setScale(0.5, 0.5);

        this.girl = objectFactory.createAnimation(CharacterType.girl, "run", 3)!;
        this.girl.playInfinite(1);
        this.girl.setPosition(800, 500);
        this.girl.setScale(0.5, 0.5);
    }
    public draw(): void {
        p.push();

        this.drawManager.drawing();
        this.UpdateMove();

        let isGirlUpperBoy = this.girl.getY() > this.boy.getY();
        if (isGirlUpperBoy) {
            this.boy.draw();
            this.girl.draw();
        } else {
            this.girl.draw();
            this.boy.draw();
        }

        this.uiManager.drawing();
        this.animationManager.update();
        this.timeTracker.update(deltaTime);

        p.pop();
    }

    public mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }

    private UpdateMove(): void {
        if (this.timeTracker.ifTimeOver(this.targetTime)) {
            this.animationDuration = Math.random() * (1.5 - 0.3) + 0.3;
            this.animationDelay = this.animationDuration + 0.05;
            this.targetTime = this.timeTracker.getCurrentTime() + this.animationDelay;

            let boyAnimation = new MoveAnimation(this.boy, Math.random() * (1100 - 400) + 400, Math.random() * (700 - 400) + 400, this.animationDuration, EaseType.OutCubic);
            let girlAnimation = new MoveAnimation(this.girl, Math.random() * (1000 - 400) + 400, Math.random() * (700 - 400) + 400, this.animationDuration, EaseType.OutCubic);
            this.clearAnimation();
            this.startAnimation(boyAnimation.reset());
            this.startAnimation(girlAnimation.reset());
        }
    }

    public getPreviousScene(): number { return 222; }

    public getNextScene(): number { return 302; }
}