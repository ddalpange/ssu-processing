public class Scene_302 extends BaseScene {
  int Y_AXIS = 1;
  int X_AXIS = 2;
  color b1, b2;
  @Override
  public int getPreviousScene() { return 301; }

  @Override
  public int getNextScene() { return 303; }

  private final float treeDefaultScale = 0.088f;
  private final float treeScaleDuration = 0.4f;

  private ShapeObject tree;
  private ScaleAnimation treeScaleUpAnimation;
  private ScaleAnimation treeScaleDownAnimation;
  private int curCount = 0;

  private TimeTracker timeTracker = new TimeTracker();


  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("39", drawManager);

    b1 = color(#805955);
    b2 = color(#1c1a27);

    tree = objectFactory.create("res/images/object/tree_to_climb.png");
    tree.setPosition(970, 130);
    tree.setScale(treeDefaultScale, treeDefaultScale);
    drawManager.addDrawable(tree);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.point);
    boy.setPosition(300, 600);
    boy.setScale(0.6, 0.6);
    drawManager.addDrawable(boy);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
    girl.setPosition(160, 620);
    girl.setScale(0.6, 0.6);
    drawManager.addDrawable(girl);


    var upScale = treeDefaultScale + 0.0015f;
    treeScaleUpAnimation = new ScaleAnimation(tree, upScale,upScale,treeScaleDuration);
    treeScaleDownAnimation = new ScaleAnimation(tree, treeDefaultScale,treeDefaultScale,treeScaleDuration);

    soundManager.playOnce("res/sound/effect/301.302.304_뛰는발걸음소리.mp3");
  }
 
  public void draw() {
    pushStyle();

    // setGradient(0, 0, width, height, b2, b1, Y_AXIS);
   
    // drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    UpdateScale();
    timeTracker.update();
    popStyle();
  }
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
    pushStyle();

    noFill();
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    } else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }

    popStyle();
  }

  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }

  public void UpdateScale()
  {

   if(timeTracker.IfTimeOver(curCount * treeScaleDuration))
   {
    animationManager.clearAnimation();
    var isEven = curCount % 2 == 0;
      animationManager.startAnimation(isEven ? treeScaleUpAnimation.reset() : treeScaleDownAnimation.reset());
      curCount++;
   }
  }
}
