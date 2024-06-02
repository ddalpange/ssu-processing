public class Scene_322 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 323; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("59", drawManager);
    
    var speechBubble = objectFactory.create("res/images/ui/speech-bubble_2.png");
    speechBubble.setPosition(600, 400);
    drawManager.addDrawable(speechBubble);
  }
 
  public void draw() {
    pushStyle();
    
    background(#040348);

    drawManager.drawing();
    uiManager.drawing();
    // TODO: localize
    fontManager.drawText(
      "하늘님,",
      600, 250, 30);

    fontManager.drawText(
    "나를 살리시려거든 새 동아줄을 내려주시고",
    350, 300, 30);

    fontManager.drawText(
    "죽이시려거든 썩은 동아줄을 내려주세요!",
    350, 350, 30);

    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
