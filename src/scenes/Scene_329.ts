import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_329 extends BaseScene {
    getPreviousScene(): number { return 328; }

    getNextScene(): number { return 330; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("66", this.drawManager);

        let goldRope = objectFactory.create("res/images/character/gold rope handing.png");
        goldRope.setPosition(p.width / 2, 250);
        goldRope.setScale(0.25, 0.25);
        this.drawManager.addDrawable(goldRope);
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