public class Scene_311 extends BaseScene {
  @Override
  public int getPreviousScene() { return 310; }

  @Override
  public int getNextScene() { return 312; }
  
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("48", drawManager);
    
    var speechBubble = objectFactory.create("res/images/ui/tx box.png");
    speechBubble.setPosition(600, 300);
    drawManager.addDrawable(speechBubble);
  }
 
  public void draw() {
    pushStyle();
    
    background(#040348);
    println("Scene_311 : draw");

    drawManager.drawing();
    uiManager.drawing();
    // TODO: localize
    fontManager.drawText(
      "하늘님,",
      570, 250, 30);

      fontManager.drawText(
      "저희를 살리시려거든 새 동아줄을 내려주시고",
      350, 300, 30);

      fontManager.drawText(
      "죽이시려거든 썩은 동아줄을 내려주세요!",
      380, 350, 30);

    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
