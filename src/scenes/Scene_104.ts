import PImage from 'p5';
import { loadBackground, objectFactory } from '../interfaces/Objects';
import { BaseScene } from '../interfaces/BaseScene';
import { HPBar } from '../objects/HPBar';
import { ShapeObject } from '../interfaces/ShapeObject';
import { Button2 } from '../objects/Button2';
import { PVector } from '../interfaces/PVector';

export class Scene_104 extends BaseScene {
  hpBar: HPBar = new HPBar(20, 20);
  hammerZAngle: number = 60;
  hammerMaxAngle: number = 60;

  private 절구1!: ShapeObject;
  private 절구2!: ShapeObject;
  private 절구Flag: boolean = false;

  hitCount!: number;

  private leftArrow!: ShapeObject;
  private rightArrow!: ShapeObject;
  arrowDescButton!: Button2;
  hammerImage!: PImage.Image;

  getPreviousScene(): number { return 103; }
  getNextScene(): number { return 105; }

  setup(): void {
    this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
    this.uiManager.dialogUi.next();

    loadBackground("4", this.drawManager);

    this.절구1 = objectFactory.create("res/images/object/mortar-04.png");
    this.절구1.setPosition(p.width / 2, 700);
    this.절구1.setScale(0.4, 0.4);
    this.절구2 = objectFactory.create("res/images/object/mortar-05.png");
    this.절구2.setPosition(p.width / 2, 700);
    this.절구2.setScale(0.4, 0.4);

    this.hammerImage = p.loadImage("res/images/character/hamor_hand.png");
    //translate(width / 2, height / 2); // 원하는 위치로 이동 (예: 화면 중심)
    //translate(imgWidth / 2, imgHeight / 2); // 우하단 기준으로 이동
    this.drawManager.addDrawable(this.hpBar);


    this.leftArrow = objectFactory.create("res/images/UI/Arrow_L.png");
    this.leftArrow.setPosition(970, 550);
    this.leftArrow.setScale(0.8, 0.8);

    this.rightArrow = objectFactory.create("res/images/UI/Arrow_R.png");
    this.rightArrow.setPosition(1180, 550);
    this.rightArrow.setScale(0.8, 0.8);

    this.arrowDescButton = new Button2("res/images/UI/subtitle_bar_2.png", 1065, 670);
    this.arrowDescButton.setScale(0.4, 0.4);
    this.arrowDescButton.textOffset = locale == "en" ? new PVector(-10, 0) : new PVector(-5, 0);
    this.arrowDescButton.text = locale == "en" ? "Press Left or Right Arrow Key" : "좌우 방향키를 누르세요!";


    // TODO: 뭔가 다른식으로 재생해야 할듯??
    //this.soundManager.playOnce("res/sound/effect/104_미니게임효과음.mp3");
  }

  draw(): void {
    p.push();
    this.checkKey();

    this.drawManager.drawing();

    if (this.절구Flag) {
      this.절구1.draw();
    } else {
      this.절구2.draw();
    }

    this.drawHammer();

    this.leftArrow.draw();
    this.rightArrow.draw();
    this.arrowDescButton.draw();

    this.uiManager.drawing();

    p.pop();
  }

  checkKey(): void {
    if (!this.keyPressed) return;

    let left = p.keyCode === 37;
    let right = p.keyCode === 39;

    if (left && right) return;

    let previousAngle = this.hammerZAngle;
    if (left) {
      this.hammerZAngle = Math.max(this.hammerZAngle - 10, 0);
    }

    if (right) {
      this.hammerZAngle = Math.min(this.hammerZAngle + 5, this.hammerMaxAngle);
    }

    console.log(this.hammerZAngle);
    if (this.hammerZAngle === 0 && previousAngle !== 0) {
      this.절구Flag = !this.절구Flag;
      this.hpBar.hp += 1;

      if (this.hpBar.hp === 10) {
        this.loadNextScene();
      }
    }
  }

  drawHammer(): void {
    p.push();
  
    // 우하단을 회전 축으로 이동
    p.translate(500 + this.hammerImage.width, 50 + this.hammerImage.height - 75);
    p.rotate(p.radians(this.hammerZAngle));
    
    // 회전 축을 기준으로 이미지를 그리기 위해 원점에서 이동
    p.image(this.hammerImage, -this.hammerImage.width, -this.hammerImage.height);
    
    p.pop();
  }
}