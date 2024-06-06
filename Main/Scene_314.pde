public class Scene_314 extends BaseScene {
  @Override
  public int getPreviousScene() { return 313; }

  @Override
  public int getNextScene() { return 315; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("51", drawManager);

    var bronzeRope = objectFactory.create("res/images/character/bronze rope handing.png");
    bronzeRope.setPosition(width/2, 0);
    bronzeRope.setScale(0.3, 0.3);
    drawManager.addDrawable(bronzeRope);
    // var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    // oldRope.setPosition(width / 2, 300);
    // oldRope.setScale(0.15, 0.15);
    // drawManager.addDrawable(oldRope);

    // var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    // boy.setPosition(550, 240);
    // boy.setScale(0.5, 0.5);
    // drawManager.addDrawable(boy);

    // var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    // girl.setPosition(730, 650);
    // girl.setScale(-0.5, 0.5);
    // drawManager.addDrawable(girl);

    // 오누이손 리소스 필요

    soundManager.playOnce("res/sound/effect/314.319_밧줄잡는소리.mp3");
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
