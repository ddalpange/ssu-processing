import { BaseScene } from "../interfaces/BaseScene";
import { fontManager } from "../interfaces/FontManager";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_322 extends BaseScene {
    getPreviousScene(): number {
        return 311;
    }

    getNextScene(): number {
        return 323;
    }

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("59", this.drawManager);

        let speechBubble = objectFactory.create("res/images/ui/tx box.png");
        speechBubble.setPosition(600, 300);
        this.drawManager.addDrawable(speechBubble);
    }

    draw() {
        p.push();

        p.background(4, 3, 72);

        this.drawManager.drawing();
        this.uiManager.drawing();

        if (locale === "ko") {
            fontManager.drawText2("하늘님,", 570, 250, 30);
            fontManager.drawText2("나를 살리시려거든 새 동아줄을 내려주시고", 352, 300, 30);
            fontManager.drawText2("죽이시려거든 썩은 동아줄을 내려주십시오!", 355, 350, 30);
        } else {
            fontManager.drawText2("God,", 570, 250, 30);
            fontManager.drawText2("if you want to save me, give me a new rope,", 315, 300, 30);
            fontManager.drawText2("or if you want to kill me, give me a rotten rope!", 305, 350, 30);
        }

        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}