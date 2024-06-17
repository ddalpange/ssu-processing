import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_108 extends BaseScene {
    getPreviousScene() {
        return 107;
    }

    getNextScene() {
        return 109;
    }

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("9-1", this.drawManager);

        const tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.threat);
        tiger.setPosition(250, 500);
        tiger.setScale(0.5, 0.5);
        this.drawManager.addDrawable(tiger);

        loadBackground("9-2", this.drawManager);

        const mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.back_ricecake);
        mom.setPosition(950, 650);
        mom.setScale(0.7, 0.7);
        this.drawManager.addDrawable(mom);
    }

    draw() {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        }

        this.loadNextScene();
    }
}