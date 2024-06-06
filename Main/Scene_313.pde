public class Scene_313 extends BaseScene {
  @Override
  public int getPreviousScene() { return 312; }

  @Override
  public int getNextScene() { return 319; }

  GhostLegGameManager gameManager;
  Drawable newRope;
  Drawable oldRope;

  private final float twinkleDelay = 0.7f;
  private int count = 0;
  private float curTime;
  private TimeTracker timeTracker = new TimeTracker();

  private ShapeObject twinkle;
  private ShapeObject twinkle2;
  
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("50", drawManager);

    PVector ropeScale = new PVector(0.15, 0.15);
    newRope = objectFactory.create("res/images/object/rope_strong.png");
    newRope.setPosition(250, 0);
    newRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(newRope, 350, 200, 2));
    drawManager.addDrawable(newRope);

    oldRope = objectFactory.create("res/images/object/rope_weak.png");
    oldRope.setPosition(width - 250, 0);
    oldRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(oldRope, width - 350, 200, 2));
    drawManager.addDrawable(oldRope);

    var questionMark = objectFactory.create("res/images/UI/question-mark.png");
    questionMark.setPosition(900, 300);
    questionMark.setScale(0.25, 0.25);
    drawManager.addDrawable(questionMark);

    twinkle = objectFactory.create("res/images/object/Twinkle.png");
    twinkle.setPosition(150, 220);
    twinkle.setScale(0.2, 0.2);
    drawManager.addDrawable(twinkle);

    twinkle2 = objectFactory.create("res/images/object/Twinkle.png");
    twinkle2.setPosition(340, 420);
    twinkle2.setScale(0.2, 0.2);
    drawManager.addDrawable(twinkle2);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.back);
    boy.setPosition(570, 600);
    boy.setScale(0.8, 0.8);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.back);
    girl.setPosition(760, 600);
    girl.setScale(0.8, 0.8);
    drawManager.addDrawable(girl);

    gameManager = new GhostLegGameManager(2, new int[] {319, 314}, new Drawable[]{newRope, oldRope});

    curTime = timeTracker.GetCurrentTime();
  }
 
  public void draw() {
    pushStyle();

    drawGradientBackground();
    newRope.update();
    oldRope.update();
    drawManager.drawing();
    uiManager.drawing();
    timeTracker.update();
    TwinkleUpdate();
    popStyle();
  }

  private void TwinkleUpdate()
  {
   if(timeTracker.IfTimeOver(curTime + count * twinkleDelay))
   {
    var isOdd = count % 2 != 0;
    twinkle.setPosition(150, isOdd ? 220 : 420);
    twinkle2.setPosition(340, isOdd ? 420 : 220);
      count++;
   }
  }
  
  public void mousePressed() {
    gameManager.update();
    //loadNextScene();
  }
}
