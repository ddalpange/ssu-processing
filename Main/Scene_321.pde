public class Scene_321 extends BaseScene {
  @Override
  public int getPreviousScene() { return 320; }

  @Override
  public int getNextScene() { return 322; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("58", drawManager);

    // 배경, 나무, 도끼 필요
    
    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(400, 120);
    goldRope.setScale(0.09, 0.09);
    drawManager.addDrawable(goldRope);
    
    // var rope = objectFactory.create("res/images/object/rope_strong.png");
    // rope.setPosition(255, 120);
    // rope.setScale(0.04, 0.04);
    // drawManager.addDrawable(rope);

    // var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    // boy.setPosition(225, 70);
    // boy.setScale(0.15, 0.15);
    // drawManager.addDrawable(boy);

    // var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    // girl.setPosition(275, 160);
    // girl.setScale(-0.15, 0.15);
    // drawManager.addDrawable(girl);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.pray);
    tiger.setPosition(580, 390);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);
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
