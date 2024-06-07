public class Scene_327 extends BaseScene {
  @Override
  public int getPreviousScene() { return 326; }

  @Override
  public int getNextScene() { return 328; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("64", drawManager);


    var goldRope = objectFactory.create("res/images/character/gold_rope_hanging_night.png");
    goldRope.setPosition(100, 100);
    goldRope.setScale(0.1, 0.1);
    drawManager.addDrawable(goldRope);


    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.fall);
    tiger.setPosition(500, 200);
    tiger.setScale(0.2, 0.2);
    drawManager.addDrawable(tiger);

    startAnimation(new MoveAnimation(tiger, 500, 600, 10, EaseType.OutCubic));
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
