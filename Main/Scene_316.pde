public class Scene_316 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 317; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("53-1", drawManager);


    // 리소스 교체 필요
    // var oldRope = objectFactory.create("res/images/objects/rope_old.png");
    // oldRope.setPosition(width / 2, -50);
    // oldRope.setScale(0.3, 0.3);
    // drawManager.addDrawable(oldRope);
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  int clickCount = 0;
  public void mousePressed() {
    if (clickCount == 0) {
      loadBackground("53-2", drawManager);
      ++clickCount;
      return;
    }

    if (clickCount == 1) {
      loadBackground("53-3", drawManager);
      ++clickCount;
      return;
    }

    loadNextScene();
  }
}
