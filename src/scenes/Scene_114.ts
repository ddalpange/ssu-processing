import { BaseScene } from "../interfaces/BaseScene";
import { EaseType } from "../interfaces/EaseType";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";

export class Scene_114 extends BaseScene {
    public getPreviousScene(): number { return 113; }

    public getNextScene(): number { return 201; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("15-1", this.drawManager);

        let tiger = objectFactory.createAnimation(CharacterType.tiger_mom, "back_run", 2)!;

        let animDuration = 5;
        let spriteAnimCycle = 1;
        tiger.playNTimes(spriteAnimCycle, Math.floor(animDuration / spriteAnimCycle));
        tiger.setPosition(700, 450);
        tiger.setScale(0.5, 0.5);
        this.drawManager.addDrawable(tiger);

        this.startAnimation(new MoveAnimation(tiger, tiger.x + 150, tiger.y - 80, animDuration, EaseType.Linear));
        this.startAnimation(new ScaleAnimation(tiger, tiger.scale.x * 0.6, tiger.scale.y * 0.6, animDuration, EaseType.Linear));

        loadBackground("15-2", this.drawManager);

        //this.soundManager.playOnce("res/sound/effect/114_발자국소리.mp3");
    }

    public draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.animationManager.update();

        p.pop();
    }

    public mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}