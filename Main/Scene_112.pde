public class Scene_112 extends BaseScene {
  @Override
  public int getPreviousScene() { return 111; }

  @Override
  public int getNextScene() { return 113; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("13", drawManager);

    var cloth = objectFactory.create("res/images/object/cloth_blood.png");
    cloth.setPosition(width / 2 - 100, height / 2);
    cloth.setScale(-1, 1);
    drawManager.addDrawable(cloth);

    soundManager.playOnce("res/sound/effect/112_옷만지는소리.mp3");
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
