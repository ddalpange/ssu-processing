public class Scene_314 extends BaseScene {
  @Override
  public int getPreviousScene() { return 313; }

  @Override
  public int getNextScene() { return 315; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("51", drawManager);

    var bronzeRope = objectFactory.create("res/images/character/bronze rope handing.png");
    bronzeRope.setPosition(width/2, 0);
    bronzeRope.setScale(0.3, 0.3);
    drawManager.addDrawable(bronzeRope);
    soundManager.playOnce("res/sound/effect/314.319_밧줄잡는소리.mp3");
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
