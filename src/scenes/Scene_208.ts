import { BaseScene } from "../interfaces/BaseScene";
import { EffectType } from "../interfaces/EffectType";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { Candle } from "../objects/Candle";

export class Scene_208 extends BaseScene {
    private sleepEffectRemainSeconds: number = 0;
    private clickCount: number = 0;

    public getPreviousScene(): number { return 207; }

    public getNextScene(): number { return 209; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("23", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_02);
        tiger.setPosition(p.width / 2 + 212, 460);
        tiger.setScale(-0.71, 0.71);
        this.drawManager.addDrawable(tiger);

        let candle = new Candle(p.width / 2 + 5, 142);
        this.drawManager.addDrawable(candle);

        let knife = objectFactory.create("res/images/object/knife.png");
        knife.setPosition(800, 350);
        knife.setScale(-0.85, 0.85);
        this.drawManager.addDrawable(knife);
    }

    public draw(): void {
        p.push();

        this.sleepEffectRemainSeconds -= deltaTime;
        if (this.sleepEffectRemainSeconds < 0) {
            this.sleepEffectRemainSeconds = 1;
            this.effectManager.addParticles(p.width / 2 + 440, 340, EffectType.SLEEP);
        }
        p.background(255, 255, 255);
        this.drawManager.drawing();
        this.uiManager.drawing();
        this.effectManager.updateAndDraw();

        p.pop();
    }

    public mousePressed(): void {
        if (this.clickCount == 0) {
            this.effectManager.addParticles(p.width / 2 + 20, p.height / 2, EffectType.BLOOD);
            this.clickCount++;

            let mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.left_half);
            p.translate(p.width / 2, p.height / 2);
            p.rotateZ(p.PI / 3.0);
            mom.setPosition(p.width / 2 + 212, 290);
            mom.setScale(0.5, 0.5);
            this.drawManager.addDrawable(mom);

            let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.climb);
            boy.setPosition(300, 700);
            boy.setScale(0.7, 0.7);
            this.drawManager.addDrawable(boy);

            let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.climb);
            girl.setPosition(p.width / 2 + 300, 700);
            girl.setScale(0.7, 0.7);
            this.drawManager.addDrawable(girl);
        } else {
            if (this.uiManager.dialogUi.next()) {
                return;
            }
            this.loadNextScene();
        }
    }
}