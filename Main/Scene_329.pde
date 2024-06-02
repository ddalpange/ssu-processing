public class Scene_329 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 330; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("66", drawManager);

    var newRope = objectFactory.create("res/images/objects/rope_new.png");
    newRope.setPosition(400, 50);
    newRope.setScale(0.2, 0.2);
    drawManager.addDrawable(newRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    boy.setPosition(310, 300);
    boy.setScale(0.6, 0.6);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    girl.setPosition(490, 300);
    girl.setScale(-0.6, 0.6);
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
    loadNextScene();
  }
}
