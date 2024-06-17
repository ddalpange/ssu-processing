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

    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(400, 100);
    goldRope.setScale(0.2, 0.2);
    drawManager.addDrawable(goldRope);

    var oldRope = objectFactory.create("res/images/object/rope_weak.png");
    oldRope.setPosition(850, -50);
    oldRope.setScale(0.1, 0.1);
    drawManager.addDrawable(oldRope);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb_rope);
    tiger.setPosition(855, 320);
    tiger.setScale(0.4, 0.4);
    drawManager.addDrawable(tiger);

    soundManager.playOnce("res/sound/effect/315.325_밧줄투욱끊어지는소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
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
