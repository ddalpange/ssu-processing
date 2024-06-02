public class Scene_302 extends BaseScene {
  int Y_AXIS = 1;
  int X_AXIS = 2;
  color b1, b2;
  @Override
  public int getPreviousScene() { return -1; }

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

    // int numStars = 30; // 별의 수
    // float[] starX = new float[numStars];
    // float[] starY = new float[numStars];
    // float[] starBrightness = new float[numStars];
    // float[] starBrightnessChange = new float[numStars];
    // color[] starColor = new color[numStars];

    // for (int i = 0; i < numStars; i++) {
    //   starX[i] = random(width);
    //   starY[i] = random(height / 2.5); // 상단 1/2.5 영역에만 별을 배치
    //   starBrightness[i] = random(100, 255);
    //   starBrightnessChange[i] = random(-10, 100); // 밝기 변화량 설정
    // }

    // Drawable starlight = new Starlight(numStars, starX, starY, starBrightness, starBrightnessChange, starColor);
    // drawManager.addDrawable(starlight);
    
    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.point);
    boy.setPosition(300, 600);
    boy.setScale(0.4, 0.4);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.back);
    girl.setPosition(160, 620);
    girl.setScale(0.4, 0.4);
    drawManager.addDrawable(girl);

    // 구름 필요

    // 나무 리소스 교체 필요

    // var tree1 = objectFactory.create(BackgroundType.무서운나무);
    // tree1.setPosition(200, 300);
    // tree1.setScale(0.02, 0.02);
    // drawManager.addDrawable(tree1);

    // var tree2 = objectFactory.create(BackgroundType.무서운나무);
    // tree2.setPosition(300, 300);
    // tree2.setScale(0.02, 0.02);
    // drawManager.addDrawable(tree2);

    // var tree3 = objectFactory.create(BackgroundType.무서운나무);
    // tree3.setPosition(400, 300);
    // tree3.setScale(0.02, 0.02);
    // drawManager.addDrawable(tree3);

    // var tree4 = objectFactory.create(BackgroundType.무서운나무);
    // tree4.setPosition(500, 300);
    // tree4.setScale(0.02, 0.02);
    // drawManager.addDrawable(tree4);

    // var bigTree = objectFactory.create(BackgroundType.무서운나무);
    // bigTree.setPosition(1200, 300);
    // bigTree.setScale(0.05, 0.05);
    // drawManager.addDrawable(bigTree);

    var upScale = treeDefaultScale + 0.0015f;
    treeScaleUpAnimation = new ScaleAnimation(tree, upScale,upScale,treeScaleDuration);
    treeScaleDownAnimation = new ScaleAnimation(tree, treeDefaultScale,treeDefaultScale,treeScaleDuration);
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
