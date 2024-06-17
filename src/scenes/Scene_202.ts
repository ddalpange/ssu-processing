import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { Candle } from "../objects/Candle";

export class Scene_202 extends BaseScene {
    public getPreviousScene(): number { return 201; }

    public getNextScene(): number { return 203; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("17", this.drawManager);

        let tigerHand = objectFactory.create("res/images/character/tiger_hand.png");
        tigerHand.setPosition(300, 180);
        tigerHand.setScale(0.65, 0.65);
        this.drawManager.addDrawable(tigerHand);

        let candle = new Candle(p.width / 2 + 185, 202);
        this.drawManager.addDrawable(candle);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.back);
        boy.setPosition(800, 550);
        boy.setScale(0.7, 0.7);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
        girl.setPosition(1000, 600);
        girl.setScale(0.7, 0.7);
        this.drawManager.addDrawable(girl);
    }

    public draw(): void {
        p.push();

        p.background(255);
        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    public mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}