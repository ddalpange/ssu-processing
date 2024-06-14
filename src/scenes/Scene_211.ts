import { BaseScene } from "../interfaces/BaseScene";
import { DrawManager } from "../interfaces/DrawManager";
import { EffectType } from "../interfaces/EffectType";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { Candle } from "../objects/Candle";

function Scene_211_Family_Setup(drawManager: DrawManager): void {
    let mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.front);
    mom.setPosition(130, 500);
    mom.setScale(0.7, 0.7);
    drawManager.addDrawable(mom);

    let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.front);
    boy.setPosition(300, 550);
    boy.setScale(0.7, 0.7);
    drawManager.addDrawable(boy);

    let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.front);
    girl.setPosition(450, 600);
    girl.setScale(0.7, 0.7);
    drawManager.addDrawable(girl);
}

export class Scene_211 extends BaseScene {
    private sleepEffectRemainSeconds: number = 0;

    public getPreviousScene(): number { return 210; }

    public getNextScene(): number { return 212; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("25", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_03);
        tiger.setPosition(p.width / 2 + 200, 450);
        tiger.setScale(-1, 1);
        this.drawManager.addDrawable(tiger);

        let candle = new Candle(p.width / 2 + 5, 142);
        this.drawManager.addDrawable(candle);

        Scene_211_Family_Setup(this.drawManager);
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