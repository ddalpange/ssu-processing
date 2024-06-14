import { BaseScene } from "../interfaces/BaseScene";
import { DrawManager } from "../interfaces/DrawManager";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_305 extends BaseScene {
    runMoveAnimation!: MoveAnimation;
    runScaleAnimation!: ScaleAnimation;

    private readonly waitDuration: number = 1.5;
    private readonly moveDuration: number = 1.5;

    private timeTracker: TimeTracker = new TimeTracker();

    getPreviousScene(): number { return 304; }

    getNextScene(): number { return 306; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("42", this.drawManager);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.seat);
        boy.setPosition(500, 140);
        boy.setScale(0.3, 0.3);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.seat);
        girl.setPosition(615, 160);
        girl.setScale(0.3, 0.3);
        this.drawManager.addDrawable(girl);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb);
        tiger.setPosition(300, 600);
        tiger.setScale(0.5, 0.5);
        this.drawManager.addDrawable(tiger);

        this.runMoveAnimation = new MoveAnimation(tiger, 960, 560, this.moveDuration, EaseType.InOutQuad);
        this.runScaleAnimation = new ScaleAnimation(tiger, 0.25, 0.25, this.moveDuration);
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.animationManager.update();
        this.timeTracker.update(deltaTime);
        this.MoveUpdate();

        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }

    private MoveUpdate(): void {
        if (this.timeTracker.ifTimeIs(this.waitDuration)) {
            this.startAnimation(this.runMoveAnimation);
            this.startAnimation(this.runScaleAnimation);
        }
    }
}