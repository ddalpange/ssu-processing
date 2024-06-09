public class Scene_322 extends BaseScene {
  @Override
  public int getPreviousScene() { return 311; }

  @Override
  public int getNextScene() { return 323; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("59", drawManager);
    
    var speechBubble = objectFactory.create("res/images/ui/tx box.png");
    speechBubble.setPosition(600, 300);
    drawManager.addDrawable(speechBubble);
  }
 
  public void draw() {
    pushStyle();
    
    background(#040348);

    drawManager.drawing();
    uiManager.drawing();
    // God, if you want to save me, give me a new rope, or if you want to kill me, give me a rotten rope!
    // 하늘님, 나를 살리시려거든 새 동아줄을 내려주시고 죽이시려거든 썩은 동아줄을 내려주십시오!
    if (locale == "ko") {
      fontManager.drawText(
      "하늘님,",
      570, 250, 30);

      fontManager.drawText(
      "나를 살리시려거든 새 동아줄을 내려주시고",
      352, 300, 30);

      fontManager.drawText(
      "죽이시려거든 썩은 동아줄을 내려주십시오!",
      355, 350, 30);
    }
    else {
      fontManager.drawText(
      "God,",
      570, 250, 30);

      fontManager.drawText(
      "if you want to save me, give me a new rope,",
      315, 300, 30);

      fontManager.drawText(
      "or if you want to kill me, give me a rotten rope!",
      305, 350, 30);
    }

    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
