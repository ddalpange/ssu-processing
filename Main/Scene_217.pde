public class Scene_217 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("32", drawManager);

    // Drawable house = objectFactory.create("res/images/object/hut_front.png");
    // house.setPosition(width / 2 + 200, height / 2 - 40);
    // house.setScale(0.13, 0.13);
    // drawManager.addDrawable(house);

    // 배경 나중에
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    sceneManager.loadScene(new Scene_Ending());
  }
}
