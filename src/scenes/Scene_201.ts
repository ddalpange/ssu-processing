import { BaseScene } from "../interfaces/BaseScene";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { Ground } from "../objects/Ground";

export class Scene_201 extends BaseScene {
    private elapsed: number = 0;
    private knockSoundPlayed: boolean = false;
    private dialogShowed: boolean = false;

    public getPreviousScene(): number { return 114; }

    public getNextScene(): number { return 202; }

    public setup(): void {

        loadBackground("16", this.drawManager);

        //TODO: uncomment
        // let ground = new Ground(0, 500, p.width, p.height, 0, '#DAC4A2');
        // this.drawManager.addDrawable(ground);

        let tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.knock);
        tiger.setPosition(800, 500);
        tiger.setScale(0.52, 0.52);
        this.drawManager.addDrawable(tiger);

        //this.soundManager.playOnce("res/sound/effect/201_발자국소리.mp3");
    }

    public draw(): void {
        p.push();

        p.background('#cfe2f3');

        this.drawManager.drawing();
        this.uiManager.drawing();

        this.elapsed += deltaTime;
        if (this.elapsed > 5 && !this.knockSoundPlayed) {
            this.knockSoundPlayed = true;
            //this.soundManager.playOnce("res/sound/effect/201_노크소리.mp3");
        }
        if (this.elapsed > 7 && !this.dialogShowed) {
            this.dialogShowed = true;
            this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
            this.uiManager.dialogUi.next();
        }

        p.pop();
    }

    public mousePressed(): void {
        if (!this.dialogShowed) {
            return;
        }
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}