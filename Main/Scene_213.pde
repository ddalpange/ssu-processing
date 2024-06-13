public class Scene_213 extends BaseScene {
  @Override
  public int getPreviousScene() { return 212; }

  @Override
  public int getNextScene() { return 214; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("20", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.thirsty);
    tiger.setPosition(width / 2, 600);
    tiger.setScale(0.8f, 0.8f);
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
