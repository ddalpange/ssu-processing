// 호랑이가 썩은 동아줄을 고르는 미니게임
public class Scene_324 extends BaseScene {
  @Override
  public int getPreviousScene() { return 323; }

  @Override
  public int getNextScene() { return 325; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("61", drawManager);

    PVector ropeScale = new PVector(0.2, 0.2);

    var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    oldRope.setPosition(width / 2, -200);
    oldRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(oldRope, width / 2, 200, 2));
    drawManager.addDrawable(oldRope);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb_rope);
    tiger.setPosition(width / 2 + 10, 435);
    tiger.setScale(0.6, 0.6);
    drawManager.addDrawable(tiger);

    startAnimation(new MoveAnimation(oldRope, width / 2, -200 - 400, 8, EaseType.InOutSine));
    startAnimation(new MoveAnimation(tiger, width / 2, 420 - 400, 8, EaseType.InOutSine));

    // 호랑이 손 필요

    soundManager.playOnce("res/sound/effect/324_호랑이가밧줄잡는소리.mp3");
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
