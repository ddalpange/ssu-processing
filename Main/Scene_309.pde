public class Scene_309 extends BaseScene {
  @Override
  public int getPreviousScene() { return 308; }

  @Override
  public int getNextScene() { return 310; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("46", drawManager);

    var axe = objectFactory.create("res/images/object/ex.png");
    axe.setPosition(720, 150);
    axe.setScale(0.3, 0.3);
    //axe.d_rotate(30);
    drawManager.addDrawable(axe);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(650, 330);
    tiger.setScale(0.35, 0.36);
    drawManager.addDrawable(tiger);
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
