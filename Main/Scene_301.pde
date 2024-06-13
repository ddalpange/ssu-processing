public class Scene_301 extends BaseScene {
  @Override
  public int getPreviousScene() { return 222; }

  @Override
  public int getNextScene() { return 302; }

  private ShapeObject tiger;
  private SpriteAnimation boy;
  private SpriteAnimation girl;

  private float animationDuration = 1f;
  private  float animationDelay = 1.05f;
  private float targetTime = 0;

  private TimeTracker timeTracker = new TimeTracker();

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();


    loadBackground("38", drawManager);
  
    tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.angry);
    tiger.setPosition(300, 200);
    tiger.setScale(0.15f, 0.15f);
    drawManager.addDrawable(tiger);

    boy = objectFactory.createAnimation(CharacterType.boy, "run", 3);
    boy.playInfinite(1);
    boy.setPosition(700, 500);
    boy.setScale(0.5, 0.5);

    girl = objectFactory.createAnimation(CharacterType.girl, "run", 3);
    girl.playInfinite(1);
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
      boy.draw();
      girl.draw();
    }
    else
    {
      girl.draw();
      boy.draw();
    }

    uiManager.drawing();
    animationManager.update();
    timeTracker.update();
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
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
