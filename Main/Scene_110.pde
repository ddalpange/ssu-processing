public class Scene_110 extends BaseScene {
  private ShapeObject tiger;
  private final float tigerScale = 2.3f;
  private ScaleAnimation tigerScaleUpAnimation;
  private ScaleAnimation tigerScaleDownAnimation;
  private int tigerScaleDuration = 1;
  private int curCount = 0;

  private TimeTracker timeTracker = new TimeTracker();

  @Override
  public int getPreviousScene() { return 109; }

  @Override
  public int getNextScene() { return 111; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("11", drawManager);

    tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.scream);
    tiger.setPosition(width/2, height / 2);
    tiger.setScale(tigerScale, tigerScale);
    drawManager.addDrawable(tiger);
    tigerScaleUpAnimation = new ScaleAnimation(tiger, tigerScale + tigerScale * 0.03, tigerScale + tigerScale * 0.03, tigerScaleDuration);
    tigerScaleDownAnimation = new ScaleAnimation(tiger, tigerScale - tigerScale * 0.03, tigerScale - tigerScale * 0.03, tigerScaleDuration);

    var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.back);
    mom.setPosition(width / 2, 650);
    mom.setScale(0.35, 0.35);
    drawManager.addDrawable(mom);
  }
 
  public void draw() {
    pushStyle();
    
    background(#606060);
    
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    timeTracker.update();
    updateScale();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }

  private void updateScale() {
    if (timeTracker.IfTimeOver(curCount * tigerScaleDuration) && curCount < 10) {
      clearAnimation();
      var isEven = curCount % 2 == 0;
      startAnimation(isEven ? tigerScaleUpAnimation.reset() : tigerScaleDownAnimation.reset());
      curCount++;
    }
  }
}
