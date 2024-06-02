public class Scene_327 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 328; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("64", drawManager);

    // 리소스 교체 필요
    // var oldRope = objectFactory.create("res/images/objects/rope_old.png");
    // oldRope.setPosition(800, 200);
    // oldRope.setScale(0.03, 0.03);
    // drawManager.addDrawable(oldRope);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(500, 300);
    tiger.setScale(0.2, 0.2);
    drawManager.addDrawable(tiger);

    // 구름 별 마을 필요
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
