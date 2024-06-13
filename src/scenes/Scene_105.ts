import PImage from 'p5';
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from '../interfaces/Objects';
import { BaseScene } from '../interfaces/BaseScene';
import { HPBar } from '../objects/HPBar';
import { ShapeObject } from '../interfaces/ShapeObject';
import { Button2 } from '../objects/Button2';
import { PVector } from '../interfaces/PVector';

export class Scene_105 extends BaseScene {
    getPreviousScene(): number {
        return 104;
    }

    getNextScene(): number {
        return 106;
    }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("6", this.drawManager);

        const boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.smile);
        boy.setPosition(450, 500);
        this.drawManager.addDrawable(boy);

        const girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.smile);
        girl.setPosition(800, 600);
        this.drawManager.addDrawable(girl);

        const riceCake1 = objectFactory.create("res/images/object/ricecake_01_02.png");
        riceCake1.setPosition(p.width / 2 + 170, p.height - 200);
        riceCake1.setScale(1.1, 1.1);
        this.drawManager.addDrawable(riceCake1);

        const riceCake2 = objectFactory.create("res/images/object/ricecake_02_02.png");
        riceCake2.setPosition(p.width / 2 - 200, p.height - 230);
        riceCake2.setScale(1.2, 1.2);
        this.drawManager.addDrawable(riceCake2);
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