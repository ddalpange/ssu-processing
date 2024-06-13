import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_107 extends BaseScene {
    tiger: any;

    getPreviousScene() {
        return 106;
    }

    getNextScene() {
        return 108;
    }

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("8", this.drawManager);

        this.tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.black);
        this.tiger.setPosition(450, 300);
        this.tiger.setScale(0.25, 0.25);
        this.drawManager.addDrawable(this.tiger);

        const mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.back_ricecake);
        mom.setPosition(850, 430);
        mom.setScale(0.5, 0.5);
        this.drawManager.addDrawable(mom);
    }

    draw() {
        p.push();

        this.tiger.update();

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.animationManager.update();

        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        }

        if (this.tiger.isMouseOver()) {
            this.loadNextScene();
        }
    }
}