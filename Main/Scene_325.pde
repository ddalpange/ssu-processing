// 호랑이가 썩은 밧줄을 타고 따라 올라옴.
public class Scene_325 extends BaseScene {
  @Override
  public int getPreviousScene() { return 324; }

  @Override
  public int getNextScene() { return 326; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("62", drawManager);

    var newRope = objectFactory.create("res/images/object/rope_strong.png");
    newRope.setPosition(400, 120);
    newRope.setScale(0.1, 0.1);
    drawManager.addDrawable(newRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    boy.setPosition(330, 250);
    boy.setScale(0.4, 0.4);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    girl.setPosition(460, 330);
    girl.setScale(-0.4, 0.4);
    drawManager.addDrawable(girl);

    var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    oldRope.setPosition(850, 50);
    oldRope.setScale(0.1, 0.1);
    drawManager.addDrawable(oldRope);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb_rope);
    tiger.setPosition(850, 440);
    tiger.setScale(0.5, 0.5);
    drawManager.addDrawable(tiger);

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
