public class Scene_113 extends BaseScene {
  @Override
  public int getPreviousScene() { return 112; }

  @Override
  public int getNextScene() { return 114; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("14", drawManager);
    Scene_108_background_setup(drawManager);
    Scene_108_background_setup2(drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.front);
    tiger.setPosition(width/2, height / 2 + 250);
    tiger.setScale(0.7, 0.7);
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
