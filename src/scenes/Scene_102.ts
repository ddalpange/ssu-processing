import { BaseScene } from "../interfaces/BaseScene";
import { MoveAnimation } from "../interfaces/MoveAnimation";
import { objectFactory } from "../interfaces/Objects";
import { ShapeObject } from "../interfaces/ShapeObject";

export class Scene_102 extends BaseScene {
  private cloud1!: ShapeObject;
  private cloud2!: ShapeObject;

  getPreviousScene(): number {
    return 101;
  }

  getNextScene(): number {
    return 103;
  }

  setup(): void {
    const dialogForScene = this.uiManager.getDialogForScene(this);

    this.uiManager.dialogUi.enqueueAll(dialogForScene);
    this.uiManager.dialogUi.next();

    // this.loadBackground("3", this.drawManager);

    this.cloud1 = objectFactory.create("res/images/object/cloud.png");
    this.cloud1.setPosition(200, 100);
    this.cloud1.setScale(0.55, 0.55);
    this.drawManager.addDrawable(this.cloud1);
    let anim = new MoveAnimation(
      this.cloud1,
      this.cloud1.x,
      this.cloud1.y - 10,
      1.5
      // EaseType.InOutBack
    );
    anim.repeatCount = -1;
    this.startAnimation(anim);

    this.cloud2 = objectFactory.create("res/images/object/cloud2.png");
    this.cloud2.setPosition(1000, 80);
    this.cloud2.setScale(0.4, 0.4);
    this.drawManager.addDrawable(this.cloud2);
    anim = new MoveAnimation(
      this.cloud2,
      this.cloud2.x,
      this.cloud2.y + 15,
      1.8
      // EaseType.InOutBack
    );
    anim.repeatCount = -1;
    this.startAnimation(anim);

    let shoes = objectFactory.create("res/images/object/shoes.png");
    shoes.setPosition(480, 550);
    shoes.setScale(0.4, 0.4);
    this.drawManager.addDrawable(shoes);

    shoes = objectFactory.create("res/images/object/shoes.png");
    shoes.setPosition(550, 555);
    shoes.setScale(-0.3, 0.3);
    this.drawManager.addDrawable(shoes);

    shoes = objectFactory.create("res/images/object/shoes.png");
    shoes.setPosition(600, 540);
    shoes.setScale(0.3, 0.3);
    this.drawManager.addDrawable(shoes);

    // this.soundManager.playOnce("res/sound/effect/102_웃음소리.mp3");
  }

  draw(): void {
    p.push();

    // this.background(this.colors.day_sky);
    this.drawManager.drawing();
    this.animationManager.update();

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
