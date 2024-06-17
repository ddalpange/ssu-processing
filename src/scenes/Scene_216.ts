import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { ShapeObject } from "../interfaces/ShapeObject";
import { SpriteAnimation } from "../interfaces/SpriteAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_216 extends BaseScene {
    private readonly tigerDefaultScale: number = 0.62;
    private readonly tigerScaleDuration: number = 1.0;

    private tiger_anim!: SpriteAnimation;
    private tiger!: ShapeObject;
    private tigerScaleUpAnimation!: ScaleAnimation;
    private tigerScaleDownAnimation!: ScaleAnimation;
    private curCount: number = 0;

    private timeTracker: TimeTracker = new TimeTracker();

    private elapsed: number = 0;
    private step: number = 0;

    public getPreviousScene(): number { return 215; }

    public getNextScene(): number { return 217; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("30", this.drawManager);

        this.tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.well_anim_1);
        this.tiger.setPosition(p.width / 2 - 130, 345);
        this.tiger.setScale(this.tigerDefaultScale * -1, this.tigerDefaultScale);
        this.drawManager.addDrawable(this.tiger);

        let upScale = this.tigerDefaultScale + 0.009;
        this.tigerScaleUpAnimation = new ScaleAnimation(this.tiger, upScale * -1, upScale, this.tigerScaleDuration);
        this.tigerScaleDownAnimation = new ScaleAnimation(this.tiger, this.tigerDefaultScale * -1, this.tigerDefaultScale, this.tigerScaleDuration);
    }

    public draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        this.animationManager.update();
        this.UpdateScale();
        this.timeTracker.update(deltaTime);

        if (this.step >= 1) {
            this.elapsed += deltaTime;
            if (this.elapsed > 2 && this.step == 2) {
                this.drawManager.removeDrawable(this.tiger);
                this.tiger_anim = objectFactory.createAnimation(CharacterType.tiger, "well", 3)!;
                let animDuration = 1;
                let spriteAnimCycle = 1;

                this.tiger_anim.playNTimes(spriteAnimCycle, Math.floor(animDuration / spriteAnimCycle));
                this.tiger_anim.setPosition(p.width / 2 + 180, 560);
                this.tiger_anim.setScale(this.tigerDefaultScale * -1, this.tigerDefaultScale);
                this.drawManager.addDrawable(this.tiger_anim);
                //this.soundManager.playOnce("res/sound/effect/216_풍덩소리.mp3");
                this.step = 3;
            }
        }

        if (this.step == 0 && this.uiManager.dialogUi.current != null && this.uiManager.dialogUi.current.id === "216002") {
            this.step = 2;
        }
        if (this.uiManager.dialogUi.current!.id === "216004") {
            this.drawManager.removeDrawable(this.tiger_anim);
        }

        p.pop();
    }

    public mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }

    public UpdateScale(): void {
        if (this.timeTracker.ifTimeOver(this.curCount * this.tigerScaleDuration)) {
            this.animationManager.clearAnimation();
            let isEven = this.curCount % 2 == 0;
            this.animationManager.startAnimation(isEven ? this.tigerScaleUpAnimation.reset() : this.tigerScaleDownAnimation.reset());
            this.curCount++;
        }
    }
}