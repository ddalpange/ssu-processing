// 엄마를 먹고도 아직 배고픈 호랑이
public class Scene_111 extends BaseScene {
  @Override
  public int getPreviousScene() { return 110; }

  @Override
  public int getNextScene() { return 112; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("12-1", drawManager);
    Scene_108_background_setup(drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.hungry);
    tiger.setPosition(width / 2, 430);
    tiger.setScale(0.45, 0.45);
    drawManager.addDrawable(tiger);

    loadBackground("12-2", drawManager);
    Scene_108_background_setup2(drawManager);
  }
 
  public void draw() {
    pushStyle();
    
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
