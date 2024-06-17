public class Scene_305 extends BaseScene {
  @Override
  public int getPreviousScene() { return 304; }

  @Override
  public int getNextScene() { return 306; }

  MoveAnimation runMoveAnimation;
  ScaleAnimation runScaleAnimation;

  private final float waitDuration = 1.5f;
  private final float moveDuration = 1.5f;

  private TimeTracker timeTracker = new TimeTracker();

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("42", drawManager);


    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.seat);
    boy.setPosition(500, 140);
    boy.setScale(0.3, 0.3);
    drawManager.addDrawable(boy);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.seat);
    girl.setPosition(615, 160);
    girl.setScale(0.3, 0.3);
    drawManager.addDrawable(girl);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(300, 600);
    tiger.setScale(0.5, 0.5);
    drawManager.addDrawable(tiger);

    runMoveAnimation = new MoveAnimation(tiger,960,560,moveDuration, EaseType.InOutQuad);
    runScaleAnimation = new ScaleAnimation(tiger, 0.25f, 0.25f, moveDuration);
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    timeTracker.update();
    MoveUpdate();
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }

  private void MoveUpdate()
  {
    if(timeTracker.IfTimeIs(waitDuration))
    {
     startAnimation(runMoveAnimation);
     startAnimation(runScaleAnimation);
    }
  }
}
