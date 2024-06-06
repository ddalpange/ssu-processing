public class Scene_110 extends BaseScene {
  @Override
  public int getPreviousScene() { return 109; }

  @Override
  public int getNextScene() { return 111; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("11", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.scream);
    tiger.setPosition(width/2, height / 2);
    tiger.setScale(2.3, 2.3);
    drawManager.addDrawable(tiger);

    var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.back);
    mom.setPosition(width / 2, 650);
    mom.setScale(0.35, 0.35);
    drawManager.addDrawable(mom);
  }
 
  public void draw() {
    pushStyle();
    
    background(#606060);
    
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
