import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { PVector } from "../interfaces/PVector";
import { ShapeObject } from "../interfaces/ShapeObject";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_222 extends BaseScene {
    private boyPos: PVector = new PVector(400, 400);
    private girlPos: PVector = new PVector(550, 400);

    private boy!: ShapeObject;
    private girl!: ShapeObject;

    private boyMoveAnimation!: MoveAnimation;
    private girlMoveAnimation!: MoveAnimation;

    private readonly imageBuffer: number = 300;
    private readonly moveDuration: number = 10.5;

    private readonly scaleChangeTime: number = 1;
    private readonly maxWaitCount: number = 6; // 호랑이 scale 변경은 여기까지만

    private curWaitCount: number = 1;

    private timeTracker: TimeTracker = new TimeTracker();

    private SetUpObject(): void {
        this.boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.left);
        this.boy.setPosition(this.boyPos.x, this.boyPos.y);
        this.boy.setScale(0.5, 0.5);
        this.boyMoveAnimation = new MoveAnimation(this.boy, p.width + this.imageBuffer, 400, this.moveDuration, EaseType.InOutCubic);
        this.drawManager.addDrawable(this.boy);

        this.girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.left);
        this.girl.setPosition(this.girlPos.x, this.girlPos.y);
        this.girl.setScale(0.5, 0.5);
        this.girlMoveAnimation = new MoveAnimation(this.girl, p.width + 150 + this.imageBuffer, 400, this.moveDuration, EaseType.InOutCubic);
        this.drawManager.addDrawable(this.girl);

        this.startAnimation(this.boyMoveAnimation.reset());
        this.startAnimation(this.girlMoveAnimation.reset());
    }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("38", this.drawManager);
        this.SetUpObject();
    }

    public draw(): void {
        p.push();

        this.drawManager.drawing();
        this.DrawObject();
        this.uiManager.drawing();
        this.animationManager.update(); // 중요함
        this.timeTracker.update(deltaTime);

        p.pop();
    }

    private DrawObject(): void {
        if (this.maxWaitCount >= this.curWaitCount) {
            let targetTime: number = this.curWaitCount * this.scaleChangeTime;
            let needScaleChange: boolean = this.timeTracker.ifTimeOver(targetTime);

            let needToScaleUp: boolean = needScaleChange && targetTime % 2 != 0;
            let needToScaleDown: boolean = needScaleChange && targetTime % 2 == 0;

            if (needToScaleUp) {
                this.curWaitCount++;
            }

            if (needToScaleDown) {
                this.curWaitCount++;
            }
        }
    }

    public mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }

    public getPreviousScene(): number { return 221; }

    public getNextScene(): number { return 301; }
}