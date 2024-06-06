public class Scene_327 extends BaseScene {
  @Override
  public int getPreviousScene() { return 326; }

  @Override
  public int getNextScene() { return 328; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("64", drawManager);

    // 리소스 교체 필요
    // var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    // oldRope.setPosition(800, 200);
    // oldRope.setScale(0.03, 0.03);
    // drawManager.addDrawable(oldRope);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.fall);
    tiger.setPosition(500, 200);
    tiger.setScale(0.2, 0.2);
    drawManager.addDrawable(tiger);

    startAnimation(new MoveAnimation(tiger, 500, 600, 10, EaseType.OutCubic));

    // 구름 별 마을 필요
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
