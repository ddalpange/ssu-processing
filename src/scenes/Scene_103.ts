import { colors } from "../constants/colors";
import { BaseScene } from "../interfaces/BaseScene";
import { CharacterType, CharacterPoseType, objectFactory } from "../interfaces/Objects";
import { loadBackground } from "../interfaces/Objects";

function Scene_103_Setup(drawManager: any) {
    loadBackground("4", drawManager);

    let boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.smile);
    boy.setPosition(400, 450);
    boy.setScale(0.6, 0.6);
    drawManager.addDrawable(boy);

    let girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.smile);
    girl.setPosition(200, 480);
    girl.setScale(0.65, 0.65);
    drawManager.addDrawable(girl);
    
    let mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.smile);
    mom.setPosition(600, 400);
    mom.setScale(1.2, 1.2);
    drawManager.addDrawable(mom);
}

export class Scene_103 extends BaseScene {
  getPreviousScene(): number {
    return 102;
  }

  getNextScene(): number {
    return 104;
  }

  setup(): void {
    this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
    this.uiManager.dialogUi.next();

    Scene_103_Setup(this.drawManager);
  }
 
  draw(): void {
    p.pushg();
    p.background(colors.day_sky);
    
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