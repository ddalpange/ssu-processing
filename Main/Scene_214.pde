public class Scene_214 extends BaseScene {
  @Override
  public int getPreviousScene() { return 213; }

  @Override
  public int getNextScene() { return 215; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("41", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.thirsty);
    tiger.setPosition(width / 2 - 180, 350);
    tiger.setScale(0.4f, 0.4f);
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
