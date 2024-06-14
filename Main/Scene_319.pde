// 하늘에서 내려온 동아줄 중 튼튼한 새 동아줄을 잡은 오누이
public class Scene_319 extends BaseScene {
  @Override
  public int getPreviousScene() { return 318; }

  @Override
  public int getNextScene() { return 320; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("56", drawManager);

    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(width / 2, 0);
    goldRope.setScale(0.35, 0.35);
    drawManager.addDrawable(goldRope);

    soundManager.playOnce("res/sound/effect/314.319_밧줄잡는소리.mp3");
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
