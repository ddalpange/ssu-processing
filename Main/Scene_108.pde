public class Scene_108 extends BaseScene {
  @Override
  public int getPreviousScene() { return 107; }

  @Override
  public int getNextScene() { return 109; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("9-1", drawManager);
    
    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.threat);
    tiger.setPosition(250, 500);
    tiger.setScale(0.5, 0.5);
    drawManager.addDrawable(tiger);

    loadBackground("9-2", drawManager);

    var mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.back_ricecake);
    mom.setPosition(950, 650);
    mom.setScale(0.7, 0.7);
    drawManager.addDrawable(mom);
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
