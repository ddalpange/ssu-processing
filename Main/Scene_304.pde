public class Scene_304 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 305; }

    private ShapeObject tiger;
    private MoveAnimation outMoveAnimation;
    private ScaleAnimation outScaleUpAnimation;
    private final float outDuration = 0.7f;
    private final float waitDuration = 2.5f;
    private final float jumpHeight = 20;
    private final float jumpDuration = 1f;
    private final int divideValue = 5;
    private final float verticalMoveSize = 10;

    private TimeTracker timeTracker = new TimeTracker();

    private float waitStartTime = 0;
    private int curCount = 0;
    private float jumpStartTime = 0;
    private boolean ableToJump = false;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("41", drawManager);


    setup_Scene_301_BG(drawManager);

    tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.front);
    tiger.setPosition(300, 200);
    tiger.setScale(0.15f, 0.15f);
    drawManager.addDrawable(tiger);

    outMoveAnimation = new MoveAnimation(tiger, 720, 560, outDuration, EaseType.InOutCirc);
    outScaleUpAnimation = new ScaleAnimation(tiger, 0.4f, 0.4f, outDuration);
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    animationManager.update();
    uiManager.drawing();
    timeTracker.update();
    MoveUpdate();
    popStyle();
  }

  public void MoveUpdate()
  {
    if(timeTracker.IfTimeIs(waitDuration))
      {
        startAnimation(outMoveAnimation);
        startAnimation(outScaleUpAnimation);
      }

      if(timeTracker.IfTimeIs(waitDuration + outDuration))
      {
        jumpStartTime = timeTracker.GetCurrentTime();
        ableToJump = true;
      }
    
    //if(waitStartTime) 점프뛰는 연출 만들고 싶은데 머리가 안돌아간다
    //jumpTargetTime가 매 업데이트가 아니라 진입하는 직후 딱 한번만 setting 되어야할거같음
    if(ableToJump)
      Jump(jumpHeight, jumpDuration);
  }

  public void Jump(float height, float duration)
  {
      float jumpTargetTime = duration/divideValue * curCount + jumpStartTime;

      //좌우로 움직임
      tiger.setPosition(720 + (curCount/5 % 2 == 0 ? -verticalMoveSize : verticalMoveSize), tiger.getY());

      if(timeTracker.IfTimeOver(jumpTargetTime))
      {
        if(curCount % divideValue == 0)
        {
          startAnimation(new MoveAnimation(tiger, tiger.getX(), tiger.getY() - height, duration/divideValue));
        }
        if(curCount % divideValue == 1)
        {
          startAnimation(new MoveAnimation(tiger, tiger.getX(),tiger.getY() + height, duration/divideValue));
        }


        curCount++;
      }
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
