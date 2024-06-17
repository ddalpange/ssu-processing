import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_112 extends BaseScene {
    public getPreviousScene(): number { return 111; }

    public getNextScene(): number { return 113; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("13", this.drawManager);

        let cloth = objectFactory.create("res/images/object/cloth_blood.png");
        cloth.setPosition(p.width / 2 - 100, p.height / 2);
        cloth.setScale(-1, 1);
        this.drawManager.addDrawable(cloth);

        //this.soundManager.playOnce("res/sound/effect/112_옷만지는소리.mp3");
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