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

    var girl = objectFactory.createAnimation(CharacterType.girl, "smile", 2);
    girl.playInfinite(1);
    girl.setPosition(width / 2 + 80, 500);
    girl.setScale(0.6f, 0.6f);
    drawManager.addDrawable(girl);

    var boy = objectFactory.createAnimation(CharacterType.boy, "smile", 2);
    boy.playInfinite(1);
    boy.setPosition(width / 2 + 450, 500);
    boy.setScale(0.5f, 0.5f);
    drawManager.addDrawable(boy);

    var mom = objectFactory.createAnimation(CharacterType.mom, "smile", 2);
    mom.playInfinite(1);
    mom.setPosition(width / 2 + 270, 450);
    mom.setScale(1f, 1f);
    drawManager.addDrawable(mom);

    retryButton = new Button2(loadImage("res/images/ui/button_1.png"), 1080, 100);
    retryButton.text = locale == "en" ? "Want to go back?" : "다시 하시겠습니까?";
    retryButton.setScale(1, 1);
    drawManager.addDrawable(retryButton);

    creditButton = new Button2(loadImage("res/images/ui/button_1.png"), 1080, 200);
    creditButton.text = locale == "en" ? "Credits" : "제작진";
    creditButton.setScale(1, 1);
    drawManager.addDrawable(creditButton);
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    uiManager.dialogUi.next();
    if (retryButton.isClicked()) {
      sceneManager.loadScene(new Scene_204());
    }
    if (creditButton.isClicked()) {
      sceneManager.loadScene(new Scene_Ending());
    }
  }
}
