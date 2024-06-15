import { BaseScene } from "../interfaces/BaseScene";
import { ShapeObject } from "../interfaces/ShapeObject";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_302 extends BaseScene {
    Y_AXIS = 1;
    X_AXIS = 2;
    b1!: string;
    b2!: string;

    getPreviousScene() { return 301; }

    getNextScene() { return 303; }

    private readonly treeDefaultScale = 0.088;
    private readonly treeScaleDuration = 0.4;

    private tree!: ShapeObject;
    private treeScaleUpAnimation!: ScaleAnimation;
    private treeScaleDownAnimation!: ScaleAnimation;
    private curCount = 0;

    private timeTracker = new TimeTracker();

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("39", this.drawManager);

        this.b1 = '#805955';
        this.b2 = '#1c1a27';

        this.tree = objectFactory.create("res/images/object/tree_to_climb.png");
        this.tree.setPosition(970, 130);
        this.tree.setScale(this.treeDefaultScale, this.treeDefaultScale);
        this.drawManager.addDrawable(this.tree);

        let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.point);
        boy.setPosition(300, 600);
        boy.setScale(0.6, 0.6);
        this.drawManager.addDrawable(boy);

        let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
        girl.setPosition(160, 620);
        girl.setScale(0.6, 0.6);
        this.drawManager.addDrawable(girl);

        let upScale = this.treeDefaultScale + 0.0015;
        this.treeScaleUpAnimation = new ScaleAnimation(this.tree, upScale, upScale, this.treeScaleDuration);
        this.treeScaleDownAnimation = new ScaleAnimation(this.tree, this.treeDefaultScale, this.treeDefaultScale, this.treeScaleDuration);

        //this.soundManager.playOnce("res/sound/effect/301.302.304_뛰는발걸음소리.mp3");
    }

    draw() {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.animationManager.update();
        this.UpdateScale();
        this.timeTracker.update(deltaTime);
        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }

    UpdateScale() {
        if (this.timeTracker.ifTimeOver(this.curCount * this.treeScaleDuration)) {
            this.animationManager.clearAnimation();
            let isEven = this.curCount % 2 == 0;
            this.animationManager.startAnimation(isEven ? this.treeScaleUpAnimation.reset() : this.treeScaleDownAnimation.reset());
            this.curCount++;
        }
    }
}