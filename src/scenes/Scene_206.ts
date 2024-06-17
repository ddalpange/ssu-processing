import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_206 extends BaseScene {
    public getPreviousScene(): number { return 205; }

    public getNextScene(): number { return 207; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("20", this.drawManager);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.ricecake_02);
        tiger.setPosition(p.width / 2, p.height - 160);
        tiger.setScale(0.8, 0.8);
        this.drawManager.addDrawable(tiger);

        let riceCake = objectFactory.create("res/images/object/ricecake_02_02.png");
        riceCake.setPosition(p.width / 2, p.height - 255);
        riceCake.setScale(1.5, 1.5);
        this.drawManager.addDrawable(riceCake);

        //soundManager.playOnce("res/sound/effect/206_먹는소리.mp3");
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