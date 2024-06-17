import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_220 extends BaseScene {
    public getPreviousScene(): number { return 219; }

    public getNextScene(): number { return 221; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("20", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.ricecake_03_01)!;
        tiger.setPosition(p.width / 2, p.height - 160);
        tiger.setScale(0.8, 0.8);
        this.drawManager.addDrawable(tiger);

        let riceCakeBasket = objectFactory.create("res/images/object/ricecake_01_02.png");
        riceCakeBasket.setPosition(p.width / 2, p.height - 255);
        riceCakeBasket.setScale(1.5, 1.5);
        this.drawManager.addDrawable(riceCakeBasket);

        let riceCake = objectFactory.create("res/images/object/ricecake_01_01.png");
        riceCake.setPosition(p.width / 2 - 180, p.height / 2);
        riceCake.setScale(1.5, 1.5);
        this.drawManager.addDrawable(riceCake);
    }

    public draw(): void {
        p.push();

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