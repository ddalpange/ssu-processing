public class Scene_217 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("32", drawManager);

    var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.front);
    mom.setPosition(width / 2 - 230, 500);
    mom.setScale(0.6f, 0.6f);
    drawManager.addDrawable(mom);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.smile);
    girl.setPosition(width / 2 + 170, 590);
    girl.setScale(0.6f, 0.6f);
    drawManager.addDrawable(girl);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.smile);
    boy.setPosition(width / 2, 560);
    boy.setScale(0.6f, 0.6f);
    drawManager.addDrawable(boy);
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    sceneManager.loadScene(new Scene_Ending());
  }
}
