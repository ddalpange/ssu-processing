// 호랑이가 썩은 밧줄을 타고 따라 올라옴.
public class Scene_325 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 326; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("62", drawManager);

    var newRope = objectFactory.create("res/images/objects/rope_new.png");
    newRope.setPosition(400, 50);
    newRope.setScale(0.05, 0.05);
    drawManager.addDrawable(newRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    boy.setPosition(380, 100);
    boy.setScale(0.2, 0.2);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    girl.setPosition(420, 100);
    girl.setScale(-0.2, 0.2);
    drawManager.addDrawable(girl);

    var oldRope = objectFactory.create("res/images/objects/rope_old.png");
    oldRope.setPosition(1000, 50);
    oldRope.setScale(0.05, 0.05);
    drawManager.addDrawable(oldRope);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(1000, 300);
    tiger.setScale(0.15, 0.15);
    drawManager.addDrawable(tiger);

    // 배경 필요
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
