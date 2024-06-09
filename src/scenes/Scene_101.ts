import { TimeTracker } from "../interfaces/TimeTracker";
import { BaseScene } from "../interfaces/BaseScene";
import { objectFactory } from "../interfaces/Objects";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { ShapeObject } from "../interfaces/ShapeObject";

export class Scene_101 extends BaseScene {
  private readonly handScale: number = 0.5;
  private readonly treeScaleDuration: number = 0.4;

  private hand!: ShapeObject;
  private handScaleUpAnimation!: ScaleAnimation;
  private handScaleDownAnimation!: ScaleAnimation;
  private handScaleDuration: number = 1;
  private curCount: number = 0;

  private timeTracker: TimeTracker = new TimeTracker();

  getPreviousScene(): number {
    return -1;
  }

  getNextScene(): number {
    return 102;
  }

  setup(): void {
    this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
    this.uiManager.dialogUi.next();

    // loadBackground("2", drawManager);

    this.hand = objectFactory.create("res/images/character/knock_hand.png");
    this.hand.setPosition(p.width / 2 + 200, 450);
    this.hand.setScale(this.handScale, this.handScale);
    this.drawManager.addDrawable(this.hand);

    this.handScaleUpAnimation = new ScaleAnimation(
      this.hand,
      this.handScale + this.handScale * 0.05,
      this.handScale + this.handScale * 0.05,
      this.handScaleDuration
    );
    this.handScaleDownAnimation = new ScaleAnimation(
      this.hand,
      this.handScale - this.handScale * 0.05,
      this.handScale - this.handScale * 0.05,
      this.handScaleDuration
    );

    // soundManager.playOnce("res/sound/effect/101_노크소리.mp3");
    // soundManager.playOnce("res/sound/effect/101_아침효과음.mp3");
  }

  draw(): void {
    p.push();

    this.drawManager.drawing();
    this.uiManager.drawing();
    this.animationManager.update();
    this.timeTracker.update(window.deltaTime);
    this.updateScale();

    p.pop();
  }

  mousePressed(): void {
    if (this.uiManager.dialogUi.next()) {
      return;
    }
    this.loadNextScene();
  }

  private updateScale(): void {
    if (
      this.timeTracker.ifTimeOver(this.curCount * this.handScaleDuration) &&
      this.curCount < 6
    ) {
      this.clearAnimation();
      const isEven: boolean = this.curCount % 2 === 0;
      this.startAnimation(
        isEven
          ? this.handScaleUpAnimation.reset()
          : this.handScaleDownAnimation.reset()
      );
      this.curCount++;
    }
  }
}
