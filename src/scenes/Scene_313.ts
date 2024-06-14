import { BaseScene } from "../interfaces/BaseScene";
import { Drawable } from "../interfaces/Drawable";
import { GhostLegGameManager } from "../interfaces/GhostLegGameManager";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ShapeObject } from "../interfaces/ShapeObject";
import { TimeTracker } from "../interfaces/TimeTracker";

export class Scene_313 extends BaseScene {
    private gameManager!: GhostLegGameManager;
    private newRope!: Drawable;
    private oldRope!: Drawable;

    private readonly twinkleDelay = 0.7;
    private count = 0;
    private curTime!: number;
    private timeTracker = new TimeTracker();

    private twinkle!: ShapeObject;
    private twinkle2!: ShapeObject;

    getPreviousScene(): number { return 312; }

    getNextScene(): number { return 319; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("50", this.drawManager);

        let ropeScale = { x: 0.15, y: 0.15 };
        this.newRope = objectFactory.create("res/images/object/rope_strong.png");
        this.newRope.setPosition(250, -50);
        this.newRope.setScale(ropeScale.x, ropeScale.y);
        this.startAnimation(new MoveAnimation(this.newRope, 350, 200, 2));
        this.drawManager.addDrawable(this.newRope);

        this.oldRope = objectFactory.create("res/images/object/rope_weak.png");
        this.oldRope.setPosition(p.width - 250, -100);
        this.oldRope.setScale(ropeScale.x, ropeScale.y);
        this.startAnimation(new MoveAnimation(this.oldRope, p.width - 350, 200, 2));
        this.drawManager.addDrawable(this.oldRope);

        let questionMark = objectFactory.create("res/images/UI/red question.png");
        questionMark.setPosition(900, 300);
        questionMark.setScale(1, 1);
        this.drawManager.addDrawable(questionMark);

        this.twinkle = objectFactory.create("res/images/object/Twinkle.png");
        this.twinkle.setPosition(150, 220);
        this.twinkle.setScale(0.2, 0.2);
        this.drawManager.addDrawable(this.twinkle);

        this.twinkle2 = objectFactory.create("res/images/object/Twinkle.png");
        this.twinkle2.setPosition(340, 420);
        this.twinkle2.setScale(0.2, 0.2);
        this.drawManager.addDrawable(this.twinkle2);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.back);
        boy.setPosition(570, 600);
        boy.setScale(0.8, 0.8);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
        girl.setPosition(760, 600);
        girl.setScale(0.8, 0.8);
        this.drawManager.addDrawable(girl);

        this.gameManager = new GhostLegGameManager(2, [319, 314], [this.newRope, this.oldRope]);

        this.curTime = this.timeTracker.getCurrentTime();
    }

    draw(): void {
        p.push();

        this.newRope.update();
        this.oldRope.update();
        this.drawManager.drawing();
        this.uiManager.drawing();
        this.timeTracker.update(deltaTime);
        this.TwinkleUpdate();
        p.pop();
    }

    private TwinkleUpdate(): void {
        if (this.timeTracker.ifTimeOver(this.curTime + this.count * this.twinkleDelay)) {
            let isOdd = this.count % 2 !== 0;
            this.twinkle.setPosition(150, isOdd ? 220 : 420);
            this.twinkle2.setPosition(340, isOdd ? 420 : 220);
            this.count++;
        }
    }

    mousePressed(): void {
        this.uiManager.dialogUi.next();
        this.gameManager.update();
        //this.loadNextScene();
    }
}