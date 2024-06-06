// 동아줄이 끊어져 떨어지는 오누이와 바라보는 호랑이
public class Scene_317 extends BaseScene {
  @Override
  public int getPreviousScene() { return 316; }

  @Override
  public int getNextScene() { return 318; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("54", drawManager);
  
    // 리소스 교체 필요
    // var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    // oldRope.setPosition(400, 200);
    // oldRope.setScale(0.03, 0.03);
    // drawManager.addDrawable(oldRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.fall_purple);
    boy.setPosition(120, -400);
    boy.setScale(0.3, 0.3);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.fall_purple);
    girl.setPosition(400, -400);
    girl.setScale(0.3, 0.3);
    drawManager.addDrawable(girl);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(1000, 300);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);

    // 구름 별 마을 필요
    startAnimation(new MoveAnimation(boy, 120, 280, 10, EaseType.OutCubic));

    startAnimation(new MoveAnimation(girl, 400, 340, 10, EaseType.OutCubic));
  }
 
  public void draw() {
    pushStyle();
    
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
