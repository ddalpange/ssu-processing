import { BaseScene } from "../interfaces/BaseScene";
import { EffectType } from "../interfaces/EffectType";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_212 extends BaseScene {
    private sleepEffectRemainSeconds: number = 0;

    public getPreviousScene(): number { return 211; }

    public getNextScene(): number { return 213; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("27-1", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_03);
        tiger.setPosition(p.width / 2 - 160, 280);
        tiger.setScale(0.9, 0.9);
        this.drawManager.addDrawable(tiger);

        loadBackground("27-2", this.drawManager);

        let mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.front);
        mom.setPosition(p.width / 2 + 130, 500);
        mom.setScale(0.7, 0.7);
        this.drawManager.addDrawable(mom);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.front);
        boy.setPosition(p.width / 2 + 300, 550);
        boy.setScale(0.7, 0.7);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.front);
        girl.setPosition(p.width / 2 + 450, 600);
        girl.setScale(0.7, 0.7);
        this.drawManager.addDrawable(girl);

        //this.soundManager.playOnce("res/sound/effect/207.210.212_잠자는소리.mp3");
    }

    public draw(): void {
        p.push();

        this.sleepEffectRemainSeconds -= deltaTime;
        if (this.sleepEffectRemainSeconds < 0) {
            this.sleepEffectRemainSeconds = 1;
            this.effectManager.addParticles(310, 160, EffectType.SLEEP);
        }

        p.background('#F5E8A8');
        this.drawManager.drawing();
        this.uiManager.drawing();
        this.effectManager.updateAndDraw();

        p.pop();
    }

    public mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}