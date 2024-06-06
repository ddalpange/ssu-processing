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


    // 리소스 교체 필요?
    var oldRope = objectFactory.create("res/images/object/rope_strong.png");
    oldRope.setPosition(width / 2, 300);
    oldRope.setScale(0.15, 0.15);
    drawManager.addDrawable(oldRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    boy.setPosition(550, 210);
    boy.setScale(0.5, 0.5);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    girl.setPosition(730, 500);
    girl.setScale(-0.5, 0.5);
    drawManager.addDrawable(girl);

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
