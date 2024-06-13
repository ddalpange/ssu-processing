void Scene_103_Setup(DrawManager drawManager) {
    loadBackground("4", drawManager);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.smile);
    boy.setPosition(400, 450);
    boy.setScale(0.6f, 0.6f);
    drawManager.addDrawable(boy);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.smile);
    girl.setPosition(200, 480);
    girl.setScale(0.65f, 0.65f);
    drawManager.addDrawable(girl);
    
    var mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.smile);
    mom.setPosition(600, 400);
    mom.setScale(1.2f, 1.2f);
    drawManager.addDrawable(mom);
}

public class Scene_103 extends BaseScene {
  @Override
  public int getPreviousScene() { return 102; }

  @Override
  public int getNextScene() { return 104; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    Scene_103_Setup(drawManager);
  }
 
  public void draw() {
    pushStyle();
    background(colors.day_sky);
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }

    loadNextScene();
  }
}
