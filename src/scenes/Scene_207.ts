import { BaseScene } from "../interfaces/BaseScene";
import { EffectType } from "../interfaces/EffectType";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { Candle } from "../objects/Candle";

export class Scene_207 extends BaseScene {
    private sleepEffectRemainSeconds: number = 0;

    public getPreviousScene(): number { return 206; }

    public getNextScene(): number { return 208; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("22", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_01);
        tiger.setPosition(p.width / 2 + 200, 450);
        tiger.setScale(-1, 1);
        this.drawManager.addDrawable(tiger);

        let candle = new Candle(p.width / 2 + 5, 142);
        this.drawManager.addDrawable(candle);

        //this.soundManager.playOnce("res/sound/effect/207.210.212_잠자는소리.mp3");
    }

    public draw(): void {
        p.push();

        this.sleepEffectRemainSeconds -= deltaTime;
        if (this.sleepEffectRemainSeconds < 0) {
            this.sleepEffectRemainSeconds = 1;
            this.effectManager.addParticles(p.width / 2 + 440, 340, EffectType.SLEEP);
        }
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