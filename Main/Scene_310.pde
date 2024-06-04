public class Scene_310 extends BaseScene {
  @Override
  public int getPreviousScene() { return 309; }

  @Override
  public int getNextScene() { return 311; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("47", drawManager);


    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.pray);
    boy.setPosition(480, 330);
    boy.setScale(0.7, 0.7);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.pray);
    girl.setPosition(720, 350);
    girl.setScale(0.7, 0.7);
    drawManager.addDrawable(girl);

    // 오누이 눈물 이펙트?

    // 구름 추가 필요
    
    // 나무 추가 필요
  }
 
  public void draw() {
    pushStyle();
    
    
    drawGradientBackground();
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
