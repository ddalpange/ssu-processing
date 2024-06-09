public class Scene_306 extends BaseScene {
  @Override
  public int getPreviousScene() { return 305; }

  @Override
  public int getNextScene() { return 307; }

  private ShapeObject speechBubble;
  private final int originXPos = 300;
  private final int originYPos = 200;
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

    speechBubble = objectFactory.create("res/images/UI/speech-bubble.png");
    speechBubble.setPosition(originXPos, originYPos);
    speechBubble.setScale(0.45, 0.45);
    drawManager.addDrawable(speechBubble);

    var tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.back);
    tiger.setPosition(800, 600);
    tiger.setScale(0.7, 0.7);
    drawManager.addDrawable(tiger);

    curXPos = originXPos;
    curYPos = originYPos;
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

    var text = locale == "en" ? "Is there a way\nto climb the tree?" : "어떻게 하면 나무에\n올라갈 수 있을까?";
    fontManager.drawText(text, (int)targetXPos - 120, (int)targetYPos - 80, 30);

    curCount++;
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
