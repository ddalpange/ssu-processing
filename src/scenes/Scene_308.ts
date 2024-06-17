import { BaseScene } from "../interfaces/BaseScene";
import { Drawable } from "../interfaces/Drawable";
import { GhostLegGameManager } from "../interfaces/GhostLegGameManager";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_308 extends BaseScene {
    private gameManager!: GhostLegGameManager;
    private oil!: Drawable;
    private axe!: Drawable;

    getPreviousScene(): number { return 307; }

    getNextScene(): number { return 309; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("45", this.drawManager);

        this.oil = objectFactory.create("res/images/object/oil.png");
        this.oil.setPosition(250, 220);
        this.drawManager.addDrawable(this.oil);

        let questionMark = objectFactory.create("res/images/ui/green_question.png");
        questionMark.setPosition(800, 270);
        questionMark.setScale(1, 1);
        this.drawManager.addDrawable(questionMark);

        this.axe = objectFactory.create("res/images/object/ex.png");
        this.axe.setScale(0.4, 0.4);
        this.axe.setPosition(1000, 200);
        this.drawManager.addDrawable(this.axe);

        this.gameManager = new GhostLegGameManager(2, [308, 309], [this.oil, this.axe]);

        let tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.back);
        tiger.setPosition(600, 600);
        tiger.setScale(0.6, 0.6);
        this.drawManager.addDrawable(tiger);
    }

    draw(): void {
        p.push();

        this.oil.update();
        this.axe.update();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed(): void {
        this.gameManager.update();
        //this.soundManager.playOnce("res/sound/effect/303.308_미니게임클릭소리.mp3");
        if (this.uiManager.dialogUi.next()) {
            return;
        }
    }
}