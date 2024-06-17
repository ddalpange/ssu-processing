import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_310 extends BaseScene {
    getPreviousScene(): number { return 309; }

    getNextScene(): number { return 311; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("47", this.drawManager);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.pray);
        boy.setPosition(480, 330);
        boy.setScale(0.7, 0.7);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.pray);
        girl.setPosition(720, 350);
        girl.setScale(0.7, 0.7);
        this.drawManager.addDrawable(girl);

        // TODO: Add tear effect for the sister

        // TODO: Add clouds

        // TODO: Add trees
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}