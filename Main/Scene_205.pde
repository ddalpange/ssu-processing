public class Scene_205 extends BaseScene {
  @Override
  public int getPreviousScene() { return 204; }

  @Override
  public int getNextScene() { return 206; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("20", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.ricecake_03_02);
    tiger.setPosition(width / 2, height - 160);
    tiger.setScale(0.8, 0.8);
    drawManager.addDrawable(tiger);

    var riceCake = objectFactory.create("res/images/object/ricecake_02_02.png");
    riceCake.setPosition(width / 2, height - 255);
    riceCake.setScale(1.5f, 1.5f);
    drawManager.addDrawable(riceCake);
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
