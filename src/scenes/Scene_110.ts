import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { SpriteAnimation } from "../interfaces/SpriteAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_110 extends BaseScene {
    private tiger!: SpriteAnimation;
    private readonly tigerScale = 1;
    private tigerScaleUpAnimation!: ScaleAnimation;
    private tigerScaleDownAnimation!: ScaleAnimation;
    private tigerScaleDuration = 1;
    private curCount = 0;

    private timeTracker = new TimeTracker();

    getPreviousScene() {
        return 109;
    }

    getNextScene() {
        return 111;
    }

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("11", this.drawManager);

        this.tiger = objectFactory.createAnimation(CharacterType.tiger, "scream", 2)!;
        this.tiger.playInfinite(1);
        // TODO: 위치가 안맞아서 안나옴
        this.tiger.setPosition(p.width / 2, p.height / 2 - 70);
        this.tiger.setScale(this.tigerScale, this.tigerScale);
        this.drawManager.addDrawable(this.tiger);
        this.tigerScaleUpAnimation = new ScaleAnimation(this.tiger, this.tigerScale + this.tigerScale * 0.03, this.tigerScale + this.tigerScale * 0.03, this.tigerScaleDuration);
        this.tigerScaleDownAnimation = new ScaleAnimation(this.tiger, this.tigerScale - this.tigerScale * 0.03, this.tigerScale - this.tigerScale * 0.03, this.tigerScaleDuration);

        const mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.back);
        mom.setPosition(p.width / 2, 650);
        mom.setScale(0.35, 0.35);
        this.drawManager.addDrawable(mom);
    }

    draw() {
        p.push();

        p.background(0x606060);

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.animationManager.update();
        this.timeTracker.update(deltaTime);
        this.updateScale();

        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        }

        this.loadNextScene();
    }

    private updateScale() {
        if (this.timeTracker.ifTimeOver(this.curCount * this.tigerScaleDuration) && this.curCount < 10) {
            this.clearAnimation();
            const isEven = this.curCount % 2 === 0;
            this.startAnimation(isEven ? this.tigerScaleUpAnimation.reset() : this.tigerScaleDownAnimation.reset());
            this.curCount++;
        }
    }
}