public class Scene_329 extends BaseScene {
  @Override
  public int getPreviousScene() { return 328; }

  @Override
  public int getNextScene() { return 330; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("66", drawManager);

    var newRope = objectFactory.create("res/images/object/rope_strong.png");
    newRope.setPosition(width/2, 300);
    newRope.setScale(0.13, 0.13);
    drawManager.addDrawable(newRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    boy.setPosition(570, 200);
    boy.setScale(0.4, 0.4);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    girl.setPosition(700, 440);
    girl.setScale(-0.4, 0.4);
    drawManager.addDrawable(girl);

    // 구름 필요
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
