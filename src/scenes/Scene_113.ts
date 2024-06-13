import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_113 extends BaseScene {
    public getPreviousScene(): number { return 112; }

    public getNextScene(): number { return 114; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("14", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.front);
        tiger.setPosition(p.width / 2, p.height / 2 + 250);
        tiger.setScale(0.7, 0.7);
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