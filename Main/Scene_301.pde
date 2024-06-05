public class Scene_301 extends BaseScene {
  @Override
  public int getPreviousScene() { return 222; }

  @Override
  public int getNextScene() { return 302; }

  private ShapeObject tiger;
  private ShapeObject boy;
  private ShapeObject girl;

  private float animationDuration = 1f;
  private  float animationDelay = 1.05f;
  private float targetTime = 0;

  private TimeTracker timeTracker = new TimeTracker();

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();


    loadBackground("38", drawManager);
  
    tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.angry);
    tiger.setPosition(300, 200);
    tiger.setScale(0.15f, 0.15f);
    drawManager.addDrawable(tiger);

    boy = objectFactory.create(CharacterType.boy, CharacterPoseType.front);
    boy.setPosition(700, 500);
    boy.setScale(0.5, 0.5);

    girl = objectFactory.create(CharacterType.girl, CharacterPoseType.front);
    girl.setPosition(800, 500);
    girl.setScale(0.5, 0.5);
  }

  public void draw() {
    pushStyle();

    drawGradientBackground();
    drawManager.drawing();
    UpdateMove();

    //보긴안좋은데 sortingOrder 처리하는 좋은 방법
    var isGirlUpperBoy = girl.getY() > boy.getY();
    if(isGirlUpperBoy)
    {
      boy.drawImage();
      girl.drawImage();
    }
    else
    {
      girl.drawImage();
      boy.drawImage();
    }

    uiManager.drawing();
    animationManager.update();
    timeTracker.update();
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }

  private void UpdateMove()
  {
    if(timeTracker.IfTimeOver(targetTime))
    {
      animationDuration = random(0.3f,1.5f);
      animationDelay = animationDuration + 0.05f;
      targetTime = timeTracker.GetCurrentTime() + animationDelay;

      var boyAnimation = new MoveAnimation(boy, random(400,1100), random(400,700), animationDuration, EaseType.OutCubic);
      var girlAnimation = new MoveAnimation(girl, random(400,1000), random(400,700), animationDuration, EaseType.OutCubic);
      clearAnimation();
      startAnimation(boyAnimation.reset());
      startAnimation(girlAnimation.reset());
    }
  }
}
