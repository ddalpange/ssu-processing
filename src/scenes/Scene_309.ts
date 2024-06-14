import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_309 extends BaseScene {
    getPreviousScene(): number { return 308; }

    getNextScene(): number { return 310; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("46", this.drawManager);

        let axe = objectFactory.create("res/images/object/ex.png");
        axe.setPosition(800, 150);
        axe.setScale(0.3, 0.3);
        this.drawManager.addDrawable(axe);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb);
        tiger.setPosition(650, 330);
        tiger.setScale(0.35, 0.36);
        this.drawManager.addDrawable(tiger);
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