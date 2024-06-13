import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { Candle } from "../objects/Candle";

export class Scene_203 extends BaseScene {
    public getPreviousScene(): number { return 202; }

    public getNextScene(): number { return 204; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("18", this.drawManager);


        let candle = new Candle(p.width / 2 + 5, 142);
        this.drawManager.addDrawable(candle);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.back);
        boy.setPosition(300, 600);
        boy.setScale(0.6, 0.6);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
        girl.setPosition(450, 650);
        girl.setScale(0.6, 0.6);
        this.drawManager.addDrawable(girl);

        let tiger = objectFactory.createAnimation(CharacterType.tiger_mom, "big", 2);
        tiger!.setPosition(800, 400);
        tiger!.playInfinite(2);
        //tiger.setScale(0.5, 0.5);
        this.drawManager.addDrawable(tiger!);

        // TODO: Draw a rectangle to make it look like the door is open on the background image.
    }

    public draw(): void {
        p.push();

        p.noStroke();
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