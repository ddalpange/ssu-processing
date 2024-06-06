public class Scene_315 extends BaseScene {
  @Override
  public int getPreviousScene() { return 314; }

  @Override
  public int getNextScene() { return 316; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("51", drawManager);

    var bronzeRope = objectFactory.create("res/images/character/bronze rope handing.png");
    bronzeRope.setPosition(width/2, 300);
    bronzeRope.setScale(0.3, 0.3);
    drawManager.addDrawable(bronzeRope);
    // var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    // oldRope.setPosition(width / 2, 200);
    // oldRope.setScale(0.1, 0.1);
    // drawManager.addDrawable(oldRope);

    // var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    // boy.setPosition(480, -10);
    // boy.setScale(0.4, 0.4);
    // drawManager.addDrawable(boy);

    // var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    // girl.setPosition(580, 350);
    // girl.setScale(-0.4, 0.4);
    // drawManager.addDrawable(girl);


    // 구름, 별, 마을 배경(초가집, 밭) 필요

    soundManager.playOnce("res/sound/effect/315.325_밧줄투욱끊어지는소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
