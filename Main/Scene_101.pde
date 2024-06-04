public class Scene_101 extends BaseScene {
  private final float handScale = 0.5f;
  private final float treeScaleDuration = 0.4f;

  private ShapeObject hand;
  private ScaleAnimation handScaleUpAnimation;
  private ScaleAnimation handScaleDownAnimation;
  private int handScaleDuration = 1;
  private int curCount = 0;

  private TimeTracker timeTracker = new TimeTracker();

  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 102; }

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("2", drawManager);

    hand = objectFactory.create("res/images/character/knock_hand.png");
    hand.setPosition(width / 2 + 200, 450);
    hand.setScale(handScale, handScale);
    drawManager.addDrawable(hand);

    handScaleUpAnimation = new ScaleAnimation(hand, handScale + handScale * 0.05, handScale + handScale * 0.05, handScaleDuration);
    handScaleDownAnimation = new ScaleAnimation(hand, handScale - handScale * 0.05, handScale - handScale * 0.05, handScaleDuration);

    soundManager.playOnce("res/sound/effect/101_노크소리.mp3");
    soundManager.playOnce("res/sound/effect/101_아침효과음.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    timeTracker.update();
    updateScale();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }

  private void updateScale() {
    if (timeTracker.IfTimeOver(curCount * handScaleDuration) && curCount < 6) {
      clearAnimation();
      var isEven = curCount % 2 == 0;
      startAnimation(isEven ? handScaleUpAnimation.reset() : handScaleDownAnimation.reset());
      curCount++;
    }
  }
}
