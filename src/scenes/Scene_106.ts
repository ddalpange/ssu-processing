import { BaseScene } from '../interfaces/BaseScene';
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from '../interfaces/Objects';

// 어머니가 밤길에 떡을 지고 돌아가는 장면
export class Scene_106 extends BaseScene {
    getPreviousScene() {
        return 105;
    }

    getNextScene() {
        return 107;
    }

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("7", this.drawManager);

        const mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.back_ricecake);
        mom.setPosition(850, 430);
        mom.setScale(0.5, 0.5);
        this.drawManager.addDrawable(mom);

        //this.soundManager.playOnce("res/sound/effect/106_부엉이아니고올빼미소리.mp3");
    }

    draw() {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        }

        this.loadNextScene();
    }
}