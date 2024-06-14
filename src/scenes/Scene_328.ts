import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground } from "../interfaces/Objects";

export class Scene_328 extends BaseScene {
    getPreviousScene(): number { return 327; }

    getNextScene(): number { return 329; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("65", this.drawManager);
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