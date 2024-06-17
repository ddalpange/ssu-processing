import { BaseScene } from "../interfaces/BaseScene";
import { fontManager } from "../interfaces/FontManager";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_311 extends BaseScene {
    getPreviousScene(): number { return 310; }

    getNextScene(): number { return 312; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("48", this.drawManager);

        let speechBubble = objectFactory.create("res/images/ui/tx box.png");
        speechBubble.setPosition(600, 300);
        this.drawManager.addDrawable(speechBubble);
    }

    draw(): void {
        p.push();

        p.background("#040348");
        console.log("Scene_311 : draw");

        this.drawManager.drawing();
        this.uiManager.drawing();
        // TODO: localize
        fontManager.drawText2(
            "하늘님,",
            570, 250, 30);

        fontManager.drawText2(
            "저희를 살리시려거든 새 동아줄을 내려주시고",
            350, 300, 30);

        fontManager.drawText2(
            "죽이시려거든 썩은 동아줄을 내려주세요!",
            380, 350, 30);

        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}