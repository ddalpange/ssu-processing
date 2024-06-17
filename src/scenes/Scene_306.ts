import { BaseScene } from "../interfaces/BaseScene";
import { fontManager } from "../interfaces/FontManager";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { ShapeObject } from "../interfaces/ShapeObject";

export class Scene_306 extends BaseScene {
    private speechBubble!: ShapeObject;
    private readonly originXPos: number = 300;
    private readonly originYPos: number = 200;
    private readonly maxSize: number = 200;
    private readonly lerpValue: number = 0.01;

    private curXPos!: number;
    private curYPos!: number;
    private targetXPos!: number;
    private targetYPos!: number;

    private curCount: number = 0;

    getPreviousScene(): number { return 305; }

    getNextScene(): number { return 307; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("43", this.drawManager);

        this.speechBubble = objectFactory.create("res/images/ui/speech-bubble.png");
        this.speechBubble.setPosition(this.originXPos, this.originYPos);
        this.speechBubble.setScale(0.45, 0.45);
        this.drawManager.addDrawable(this.speechBubble);

        let tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.back);
        tiger.setPosition(800, 600);
        tiger.setScale(0.7, 0.7);
        this.drawManager.addDrawable(tiger);

        this.curXPos = this.originXPos;
        this.curYPos = this.originYPos;
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.TextBubbleUpdate();
        this.uiManager.drawing();

        p.pop();
    }

    private TextBubbleUpdate(): void {
        if (this.curCount % 10 === 0) {
            let randXPos = p.random(this.originXPos - this.maxSize, this.originXPos + this.maxSize);
            let randYPos = p.random(this.originYPos - this.maxSize, this.originYPos + this.maxSize);
            this.targetXPos = p.lerp(this.curXPos, randXPos, this.lerpValue);
            this.targetYPos = p.lerp(this.curYPos, randYPos, this.lerpValue);
        }

        this.speechBubble.setPosition(this.targetXPos, this.targetYPos);
        this.curXPos = this.targetXPos;
        this.curYPos = this.targetYPos;

        let text = locale === "en" ? "Is there a way\nto climb the tree?" : "어떻게 하면 나무에\n올라갈 수 있을까?";
        fontManager.drawText2(text, this.targetXPos - 120, this.targetYPos - 80, 30);

        this.curCount++;
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }
        this.loadNextScene();
    }
}