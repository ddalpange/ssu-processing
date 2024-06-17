import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_209 extends BaseScene {
    public getPreviousScene(): number { return 208; }

    public getNextScene(): number { return 210; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("24", this.drawManager);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.front);
        boy.setPosition(800, 750);
        boy.setScale(1.2, 1.2);
        this.drawManager.addDrawable(boy);

        let speechBubble = objectFactory.create("res/images/ui/speech-bubble.png");
        speechBubble.setPosition(350, 250);
        speechBubble.setScale(0.55, 0.55);
        this.drawManager.addDrawable(speechBubble);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_02);
        tiger.setPosition(350, 200);
        tiger.setScale(-0.6, 0.6);
        this.drawManager.addDrawable(tiger);

        let stones = objectFactory.create("res/images/object/stones.png");
        stones.setPosition(350, 140);
        stones.setScale(0.16, 0.16);
        this.drawManager.addDrawable(stones);

        //soundManager.playOnce("res/sound/effect/209_아이디어효과음.mp3");
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