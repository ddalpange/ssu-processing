public class Scene_314 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 315; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("51", drawManager);


    var oldRope = objectFactory.create("res/images/objects/rope_old.png");
    oldRope.setPosition(width / 2, -200);
    oldRope.setScale(0.3, 0.3);
    drawManager.addDrawable(oldRope);

    // 오누이손 리소스 필요
  }
 
  public void draw() {
    pushStyle();
    
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
