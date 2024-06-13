import { BaseScene } from "../interfaces/BaseScene";
import { Drawable } from "../interfaces/Drawable";
import { GhostLegGameManager } from "../interfaces/GhostLegGameManager";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_204 extends BaseScene {
    private gameManager!: GhostLegGameManager;

    public getPreviousScene(): number { return 203; }

    // 팥 떡 분기
    // public getNextScene(): number { return 205; }

    // 쑥 떡 분기
    public getNextScene(): number { return 218; }

    private 팥떡!: Drawable;
    private 쑥떡!: Drawable;

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("19", this.drawManager);

        this.팥떡 = objectFactory.create("res/images/object/ricecake_02_02.png");
        this.팥떡.setPosition(350, 250);
        this.팥떡.setScale(1.4, 1.4);
        this.drawManager.addDrawable(this.팥떡);

        this.쑥떡 = objectFactory.create("res/images/object/ricecake_01_02.png");
        this.쑥떡.setPosition(950, 250);
        this.쑥떡.setScale(1.4, 1.4);
        this.drawManager.addDrawable(this.쑥떡);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.point);
        boy.setPosition(p.width / 2 - 170, 710);
        boy.setScale(0.8, 0.8);
        this.drawManager.addDrawable(boy);

        this.gameManager = new GhostLegGameManager(2, [205, 218], [this.팥떡, this.쑥떡]);
    }

    public draw(): void {
        p.push();

        this.팥떡.update();
        this.쑥떡.update();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    public mousePressed(): void {
        this.gameManager.update();
        //this.soundManager.playOnce("res/sound/effect/303.308_미니게임클릭소리.mp3");
        if (this.uiManager.dialogUi.next()) {
            return;
        }
    }
}