public class Scene_202 extends BaseScene {
  @Override
  public int getPreviousScene() { return 201; }

  @Override
  public int getNextScene() { return 203; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("17", drawManager);

    var tigerHand = objectFactory.create("res/images/character/tiger_hand.png");
    tigerHand.setPosition(300, 180);
    tigerHand.setScale(0.65f, 0.65f);
    drawManager.addDrawable(tigerHand);

    var candle = new Candle(width / 2 + 185, 202);
    drawManager.addDrawable(candle);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.back);
    boy.setPosition(800, 550);
    boy.setScale(0.7f, 0.7f);
    drawManager.addDrawable(boy);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
    girl.setPosition(1000, 600);
    girl.setScale(0.7f, 0.7f);
    drawManager.addDrawable(girl);
  }
 
  public void draw() {
    pushStyle();
    
    background(255);
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
