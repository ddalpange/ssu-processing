public class Scene_216 extends BaseScene {
  @Override
  public int getPreviousScene() { return 215; }
  @Override
  public int getNextScene() { return 217; }

  private final float tigerScaleDuration = 0.4f;
  private final float tigerDefaultScale = 0.62f;
  private ScaleAnimation tigerScaleUpAnimation;
  private ScaleAnimation tigerScaleDownAnimation;
  private int curCount = 0;

  private SpriteAnimation tiger_anim;
  private ShapeObject tiger;
  private TimeTracker timeTracker = new TimeTracker();

  private float elapsed = 0;
  private int step = 0;
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("30", drawManager);
    tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.well_anim_1);
    tiger.setPosition(width / 2 - 130, 345);
    tiger.setScale(tigerDefaultScale * -1, tigerDefaultScale);
    drawManager.addDrawable(tiger);

    var upScale = tigerDefaultScale + 0.015f;
    tigerScaleUpAnimation = new ScaleAnimation(tiger, upScale,upScale,tigerScaleDuration);
    tigerScaleDownAnimation = new ScaleAnimation(tiger, tigerDefaultScale,tigerDefaultScale,tigerScaleDuration);

  }
 
  public void draw() {
    pushStyle();
    
  

    drawManager.drawing();
    uiManager.drawing();

    if (step >= 1) {
      elapsed += deltaTime;
      // if (elapsed > 1.5f && step == 1) {
        // 대사의 으악 소리만 써도 될 듯.
      //   soundManager.playOnce("res/sound/effect/216_으아아소리.mp3");
      //   step = 2;
      //   elapsed = 0;
      // }
      if (elapsed > 2f && step == 2) {

        drawManager.removeDrawable(tiger);
        tiger_anim = objectFactory.createAnimation(CharacterType.tiger, "well", 3);
        float animDuration = 1;
        float spriteAnimCycle = 1f;
        
        tiger_anim.playNTimes(spriteAnimCycle, (int)(animDuration / spriteAnimCycle));
        tiger_anim.setPosition(width / 2 + 180, 560);
        tiger_anim.setScale(-0.62, 0.62);
        drawManager.addDrawable(tiger_anim);
        soundManager.playOnce("res/sound/effect/216_풍덩소리.mp3");
        step = 3;
      }
    }

    if (step == 0 && uiManager.dialogUi.current != null && uiManager.dialogUi.current.id.equals("216002")) {
      step = 2;
    }
    if(uiManager.dialogUi.current.id.equals("216004")) {
      drawManager.removeDrawable(tiger_anim);
    }
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }

  public void UpdateScale()
  {

   if(timeTracker.IfTimeOver(curCount * tigerScaleDuration))
   {
    animationManager.clearAnimation();
    var isEven = curCount % 2 == 0;
      animationManager.startAnimation(isEven ? tigerScaleUpAnimation.reset() : tigerScaleDownAnimation.reset());
      curCount++;
   }
  }

}
