public class Scene_313 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 319; }

  GhostLegGameManager gameManager;
  Drawable newRope;
  Drawable oldRope;
  
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("50", drawManager);

    PVector ropeScale = new PVector(0.15, 0.15);
    newRope = objectFactory.create("res/images/objects/rope_new.png");
    newRope.setPosition(250, 0);
    newRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(newRope, 350, 200, 2));
    drawManager.addDrawable(newRope);

    oldRope = objectFactory.create("res/images/objects/rope_old.png");
    oldRope.setPosition(width - 250, 0);
    oldRope.setScale(ropeScale.x, ropeScale.y);
    startAnimation(new MoveAnimation(oldRope, width - 350, 200, 2));
    drawManager.addDrawable(oldRope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.back);
    boy.setPosition(500, 500);
    boy.setScale(0.3, 0.3);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.back);
    girl.setPosition(800, 500);
    girl.setScale(0.3, 0.3);
    drawManager.addDrawable(girl);

    gameManager = new GhostLegGameManager(2, new int[] {319, 314}, new Drawable[]{newRope, oldRope});
  }
 
  public void draw() {
    pushStyle();

    drawGradientBackground();
    newRope.update();
    oldRope.update();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    gameManager.update();
    //loadNextScene();
  }
}
