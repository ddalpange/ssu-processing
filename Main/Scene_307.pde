public class Scene_307 extends BaseScene {
  @Override
  public int getPreviousScene() { return 306; }

  @Override
  public int getNextScene() { return 308; }

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("44", drawManager);

    // 회전시키면 마우스 호버랑 위치가 이상해짐;; 일단 패스
    var axe = objectFactory.create("res/images/object/axe.png");
    axe.setPosition(900, 200);
    //axe.d_rotate(30);
    drawManager.addDrawable(axe);

    var oil = objectFactory.create("res/images/object/oil.png");
    oil.setPosition(400, 350);
    //oil.d_rotate(30);
    drawManager.addDrawable(oil);
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
