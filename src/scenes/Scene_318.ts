import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground } from "../interfaces/Objects";
import { Button2 } from "../objects/Button2";

export class Scene_318 extends BaseScene {
    private retryButton!: Button2;

    getPreviousScene(): number { return 317; }

    getNextScene(): number { return 313; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("55", this.drawManager);

        this.retryButton = new Button2("res/images/UI/button_1.png", 1050, 400);
        this.retryButton.text = locale === "en" ? "Retry?" : "되돌아가기";
        this.retryButton.setScale(1, 1);
        this.drawManager.addDrawable(this.retryButton);

        //this.soundManager.playOnce("res/sound/effect/318_바람소리.mp3");
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        if (this.retryButton.isClicked()) {
            this.loadNextScene();
        }

        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
    }
}