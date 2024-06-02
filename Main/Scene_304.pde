public class Scene_304 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 305; }

    private ShapeObject tiger;
    private MoveAnimation outMoveAnimation;
    private ScaleAnimation outScaleUpAnimation;
    private final float outDuration = 0.7f;
    private float waitDuration = 5f;
    private TimeTracker timeTracker = new TimeTracker();

    private float waitStartTime = 0;
    private int curCount = 0;

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
    
    //if(waitStartTime) 점프뛰는 연출 만들고 싶은데 ㅁ머리가 안돌아간다
    //jumpTargetTime가 매 업데이트가 아니라 진입하는 직후 딱 한번만 setting 되어야할거같음
    Jump(10, 0.2f);
  }

  public void Jump(float height, float duration)
  {
      float jumpTargetTime = timeTracker.GetCurrentTime() + duration/3 * curCount;
      if(timeTracker.IfTimeOver(jumpTargetTime))
      {
        if(curCount % 3 == 0)
        {
          startAnimation(new MoveAnimation(tiger, tiger.getX() - height, duration/3))
          
        }
        if(curCount % 3 == 1)
        {
          startAnimation(new MoveAnimation(tiger, tiger.getX() + height, duration/3))
        }

        if(curCount % 3 == 2) // 그냥 대기용
        {

        }
        curCount++;
      }

      if(timeTracker.IfTimeOver(jumpTargetTime))
      {
        startAnimation(new MoveAnimation(tiger, tiger.getX() + height, duration/2))
        curCount++;
      }

      if(timeTracker.IfTimeOver(jumpTargetTime))
      {
        curCount++;
      }
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
