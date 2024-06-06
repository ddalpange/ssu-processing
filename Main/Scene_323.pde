public class Scene_323 extends BaseScene {
  @Override
  public int getPreviousScene() { return 322; }

  @Override
  public int getNextScene() { return 324; }

  ShapeObject thunder1;
  ShapeObject thunder2;
  TimeTracker timeTracker = new TimeTracker();

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("60", drawManager);

    PVector ropeScale = new PVector(0.4, 0.4);
    var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    oldRope.setPosition(width / 2, -300);
    oldRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(oldRope, width / 2, 200, 2));
    drawManager.addDrawable(oldRope);

    thunder1 = objectFactory.create("res/images/object/thunder_1.png");
    thunder1.setPosition(260, -200);
    thunder1.setScale(0.6f, 0.6f);
    drawManager.addDrawable(thunder1);

    thunder2 = objectFactory.create("res/images/object/thunder_2.png");
    thunder2.setPosition(1000, -200);
    thunder2.setScale(0.6f, 0.6f);
    drawManager.addDrawable(thunder2);
    
    // 동앗줄 내려오는 효과
    soundManager.playOnce("res/sound/effect/323_천둥소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    timeTracker.update();
    animationManager.update();
    ThunderUpdate();
    popStyle();
  }

  public void ThunderUpdate()
  {
    if(timeTracker.IfTimeIs(1))
      startAnimation(new MoveAnimation(thunder1, 50, 900, 1));

    if(timeTracker.IfTimeIs(2))
      startAnimation(new MoveAnimation(thunder2, 600, 900, 1));
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
