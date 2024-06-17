import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

// 엄마를 먹고도 아직 배고픈 호랑이
export class Scene_111 extends BaseScene {
    public getPreviousScene(): number { return 110; }

    public getNextScene(): number { return 112; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("12-1", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.hungry);
        tiger.setPosition(p.width / 2, 430);
        tiger.setScale(0.45, 0.45);
        this.drawManager.addDrawable(tiger);

        loadBackground("12-2", this.drawManager);
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