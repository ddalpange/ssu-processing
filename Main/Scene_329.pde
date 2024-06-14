public class Scene_329 extends BaseScene {
  @Override
  public int getPreviousScene() { return 328; }

  @Override
  public int getNextScene() { return 330; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("66", drawManager);

    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(width/2, 250);
    goldRope.setScale(0.25, 0.25);
    drawManager.addDrawable(goldRope);
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
