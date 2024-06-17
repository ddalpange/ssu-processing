// 오누이 썩은 동아줄 분기, 313으로 다시 돌아가야 함.
public class Scene_318 extends BaseScene {
  @Override
  public int getPreviousScene() { return 317; }

  @Override
  public int getNextScene() { return 313; }

  private Button2 retryButton;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("55", drawManager);

    retryButton = new Button2(loadImage("res/images/ui/button_1.png"), 1050, 400);
    retryButton.text = locale == "en" ? "Retry?" : "되돌아가기";
    retryButton.setScale(1, 1);
    drawManager.addDrawable(retryButton);

    soundManager.playOnce("res/sound/effect/318_바람소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();

    if (retryButton.isClicked()) {
      loadNextScene();
    }
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
  }
}
