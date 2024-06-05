public class Scene_217 extends BaseScene {
  @Override
  public int getPreviousScene() { return 216; }

  @Override
  public int getNextScene() { return -1; }

  Button2 retryButton;
  Button2 creditButton;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("32", drawManager);

    var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.front);
    mom.setPosition(width / 2 - 230, 500);
    mom.setScale(0.6f, 0.6f);
    drawManager.addDrawable(mom);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.smile);
    girl.setPosition(width / 2 + 170, 590);
    girl.setScale(0.6f, 0.6f);
    drawManager.addDrawable(girl);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.smile);
    boy.setPosition(width / 2, 560);
    boy.setScale(0.6f, 0.6f);
    drawManager.addDrawable(boy);

    retryButton = new Button2(loadImage("res/images/UI/3button.png"), 1080, 100);
    retryButton.text = "Want to go back?";
    retryButton.setScale(2, 2);
    drawManager.addDrawable(retryButton);

    creditButton = new Button2(loadImage("res/images/UI/3button.png"), 1080, 200);
    creditButton.text = "Credits";
    creditButton.setScale(2, 2);
    drawManager.addDrawable(creditButton);
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (retryButton.isClicked()) {
      sceneManager.loadScene(new Scene_204());
    }
    if (creditButton.isClicked()) {
      sceneManager.loadScene(new Scene_Ending());
    }
  }
}
