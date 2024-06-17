public class Scene_221 extends BaseScene {
  @Override
  public int getPreviousScene() { return 220; }

  @Override
  public int getNextScene() { return 222; }
  public void setup() {
	uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    
    loadBackground("20", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.angry);
    // 호랑이 위치 조정
    tiger.setPosition(width / 2, height - 160);
    tiger.setScale(0.8, 0.8);
    drawManager.addDrawable(tiger);
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
