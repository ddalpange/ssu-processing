public class Scene_306 extends BaseScene {
  @Override
  public int getPreviousScene() { return 305; }

  @Override
  public int getNextScene() { return 307; }

  private ShapeObject speechBubble;
  private final int originXPos = 300;
  private final int originYPos = 100;
  private final int maxSize = 200;
  private final float lerpValue = 0.01f;

  private float curXPos;
  private float curYPos;
  private float targetXPos;
  private float targetYPos;

  private int curCount = 0;


  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("43", drawManager);

    var speechBubble = objectFactory.create("res/images/object/speech-bubble_3.png");
    speechBubble.setPosition(300, 100);
    speechBubble.setScale(0.7, 0.7);
    drawManager.addDrawable(speechBubble);

    var tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.back);
    tiger.setPosition(800, 800);
    tiger.setScale(0.7, 0.7);
    drawManager.addDrawable(tiger);

    curXPos = originXPos;
    curYPos = originYPos;

    speechBubble = objectFactory.create("res/images/ui/speech_bubble_think_1.png");
    speechBubble.setPosition(curXPos, curYPos);
    speechBubble.setScale(0.7, 0.7);
    drawManager.addDrawable(speechBubble);
  }
 
  public void draw() {
    pushStyle();
    
    
    drawGradientBackground();
    drawManager.drawing();
    TextBubbleUpdate();
    uiManager.drawing();
    popStyle();
  }

  private void TextBubbleUpdate()
  {
    if(curCount % 10 == 0)
    {
    var randXPos = random(originXPos - maxSize, originXPos + maxSize);
    var randYPos = random(originYPos - maxSize, originYPos + maxSize);
    targetXPos = lerp(curXPos, randXPos, lerpValue);
    targetYPos = lerp(curYPos, randYPos, lerpValue);
    }

    speechBubble.setPosition(targetXPos, targetYPos);
    curXPos = targetXPos;
    curYPos = targetYPos;

    curCount++;
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
