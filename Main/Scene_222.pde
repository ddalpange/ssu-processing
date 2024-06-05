public class Scene_222 extends BaseScene {
  @Override
  public int getPreviousScene() { return 221; }

  @Override
  public int getNextScene() { return 301; }

  private PVector tigerPos = new PVector(200,400);
  private PVector boyPos = new PVector(400,400);
  private PVector girlPos = new PVector(550,400);

  //private ShapeObject tiger;
  private ShapeObject boy;
  private ShapeObject girl;

  // private MoveAnimation tigerMoveAnimation;
  // private ScaleAnimation tigerScaleUpAnimation;
  // private ScaleAnimation tigerScaleDownAnimation;
  private MoveAnimation boyMoveAnimation;
  private MoveAnimation girlMoveAnimation;

  private final float imageBuffer = 300;
  private final float moveDuration = 10.5f;
  private final float tigerMoveDuration = 3f;
  private final float tigerScaleDuration = 0.7f;

  private final int waitTime = 6; // n초
  private final int scaleChangeTime = 1;
  private final int maxWaitCount = 6; // 호랑이 scale 변경은 여기까지만

  private int curWaitCount = 1;

  private TimeTracker timeTracker = new TimeTracker();

  private void SetUpObject()
  {
  //  tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.angry);
  //  tiger.setPosition(tigerPos.x,tigerPos.y);
  //  tiger.setScale(0.5f,0.5f);
  //   tigerMoveAnimation = new MoveAnimation(tiger, width + imageBuffer, 400, tigerMoveDuration, EaseType.InBack);
  //   tigerScaleUpAnimation = new ScaleAnimation(tiger, 0.52f,0.52f,tigerScaleDuration);
  //   tigerScaleDownAnimation = new ScaleAnimation(tiger, 0.5f,0.5f,tigerScaleDuration);
  //       drawManager.addDrawable(tiger);

    boy = objectFactory.create(CharacterType.boy, CharacterPoseType.left);
   boy.setPosition(boyPos.x,boyPos.y);
   boy.setScale(0.5f,0.5f);
    boyMoveAnimation = new MoveAnimation(boy, width + imageBuffer, 400, moveDuration,EaseType.InOutCubic);
        drawManager.addDrawable(boy);
   
    girl = objectFactory.create(CharacterType.girl, CharacterPoseType.left); 
   girl.setPosition(girlPos.x,girlPos.y);
   girl.setScale(0.5f,0.5f);
    girlMoveAnimation = new MoveAnimation(girl, width + 150 + imageBuffer, 400, moveDuration,EaseType.InOutCubic);
        drawManager.addDrawable(girl);

    startAnimation(boyMoveAnimation.reset());
    startAnimation(girlMoveAnimation.reset());
  }

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    loadBackground("38", drawManager);
    SetUpObject();
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    DrawObject();
    uiManager.drawing();
    animationManager.update(); // 중요함
    timeTracker.update();
    popStyle();
  }

  void DrawObject()
  {
      boolean ableToMove = timeTracker.IfTimeIs(waitTime);; // 모든 프레임을 무시하지 않기에 이런 식으로 로직 짜기 가능

      // if(ableToMove)
      //   startAnimation(tigerMoveAnimation.reset());

      if(maxWaitCount >= curWaitCount)    
      { 
        int targetTime = curWaitCount * scaleChangeTime;
      boolean needScaleChange = timeTracker.IfTimeOver(targetTime);

      boolean needToScaleUp = needScaleChange && targetTime % 2 != 0;
      boolean needToScaleDown = needScaleChange && targetTime % 2 == 0;

      if(needToScaleUp)
      {
          // stopAnimation(tigerScaleDownAnimation);
          // startAnimation(tigerScaleUpAnimation.reset());
          curWaitCount++;
      }

        if(needToScaleDown)
        {
          // stopAnimation(tigerScaleUpAnimation);
          // startAnimation(tigerScaleDownAnimation.reset());
          curWaitCount++;
        }
      }
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
