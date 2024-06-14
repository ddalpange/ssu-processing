import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { sceneManager } from "../interfaces/SceneManager";
import { Cloud_Normal } from "../objects/Clouds";
import { Scene_Ending } from "./Scene_Ending";

export class Scene_330 extends BaseScene {
    getPreviousScene(): number { return 329; }

    getNextScene(): number { return -1; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();
        loadBackground("67", this.drawManager);

        let cloud1 = new Cloud_Normal(p.width / 2 - 600, 500);
        this.drawManager.addDrawable(cloud1);

        let cloud2 = new Cloud_Normal(p.width / 2 + 100, 500);
        this.drawManager.addDrawable(cloud2);

        let sun = objectFactory.create("res/images/object/sun.png");
        sun.setPosition(p.width / 4, 250);
        sun.setScale(0.55, 0.55);
        this.drawManager.addDrawable(sun);

        let moon = objectFactory.create("res/images/object/moon.png");
        moon.setPosition(p.width / 4 * 3, 250);
        moon.setScale(-0.5, 0.5);
        this.drawManager.addDrawable(moon);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.seat);
        girl.setPosition(p.width / 2 - 300, 500);
        girl.setScale(-0.6, 0.6);
        this.drawManager.addDrawable(girl);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.seat);
        boy.setPosition(p.width / 2 + 300, 500);
        boy.setScale(0.6, 0.6);
        this.drawManager.addDrawable(boy);

        //this.soundManager.playOnce("res/sound/effect/330_빛내려오는효과음.mp3");
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

        sceneManager.loadScene(new Scene_Ending());
    }
}