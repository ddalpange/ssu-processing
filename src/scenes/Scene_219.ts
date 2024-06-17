import { BaseScene } from "../interfaces/BaseScene";
import { CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_219 extends BaseScene {
    public getPreviousScene(): number { return 218; }

    public getNextScene(): number { return 220; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("20", this.drawManager);

        let tiger = objectFactory.createAnimation(CharacterType.tiger, "ricecake01eat", 3)!;
        tiger.playNTimes(4, 1);
        tiger.setPosition(p.width / 2, p.height - 60);
        tiger.setScale(2, 2);
        this.drawManager.addDrawable(tiger);

        let riceCake = objectFactory.create("res/images/object/ricecake_01_02.png")!;
        riceCake.setPosition(p.width / 2, p.height - 255);
        riceCake.setScale(1.5, 1.5);
        this.drawManager.addDrawable(riceCake);
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