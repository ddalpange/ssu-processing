import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_213 extends BaseScene {
    public getPreviousScene(): number { return 212; }

    public getNextScene(): number { return 214; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("20", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.thirsty);
        tiger.setPosition(p.width / 2, 600);
        tiger.setScale(0.8, 0.8);
        this.drawManager.addDrawable(tiger);
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