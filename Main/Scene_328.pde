public class Scene_328 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 329; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("65", drawManager);

    // var 풀1 = objectFactory.create("res/images/objects/sorghum.png");
    // 풀1.setPosition(0, 300);
    // 풀1.setScale(0.5, 0.5);
    // drawManager.addDrawable(풀1);

    // var 풀2 = objectFactory.create("res/images/objects/sorghum.png");
    // 풀2.setPosition(200, 300);
    // 풀2.setScale(0.5, 0.5);
    // drawManager.addDrawable(풀2);

    // var 풀3 = objectFactory.create("res/images/objects/sorghum.png");
    // 풀3.setPosition(400, 300);
    // 풀3.setScale(0.5, 0.5);
    // drawManager.addDrawable(풀3);

    // var 풀4 = objectFactory.create("res/images/objects/sorghum.png");
    // 풀4.setPosition(600, 300);
    // 풀4.setScale(0.5, 0.5);
    // drawManager.addDrawable(풀4);

    // var 풀5 = objectFactory.create("res/images/objects/sorghum.png");
    // 풀5.setPosition(800, 300);
    // 풀5.setScale(0.5, 0.5);
    // drawManager.addDrawable(풀5);
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
