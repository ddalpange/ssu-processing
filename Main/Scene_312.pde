public class Scene_312 extends BaseScene {
  @Override
  public int getPreviousScene() { return 311; }

  @Override
  public int getNextScene() { return 313; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("49", drawManager);

    PVector ropeScale = new PVector(0.1, 0.1);
    var newRope = objectFactory.create("res/images/object/rope_strong.png");
    newRope.setPosition(350, 0);
    newRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(newRope, 350, 200, 2));
    drawManager.addDrawable(newRope);

    var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    oldRope.setPosition(width - 350, -100);
    oldRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(oldRope, width - 350, 170, 2));
    drawManager.addDrawable(oldRope);

    // 구름, 동앗줄 내려오는 효과

    soundManager.playOnce("res/sound/effect/312_따라란효과음.mp3");
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
