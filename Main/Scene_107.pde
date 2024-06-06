public class Scene_107 extends BaseScene {
  @Override
  public int getPreviousScene() { return 106; }

  @Override
  public int getNextScene() { return 108; }

  Drawable tiger;
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("8", drawManager);

    Scene_106_background_setup(drawManager);

    tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.black);
    tiger.setPosition(450, 300);
    tiger.setScale(0.25, 0.25);
    drawManager.addDrawable(tiger);

    var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.back_ricecake);
    mom.setPosition(850, 430);
    mom.setScale(0.5, 0.5);
    drawManager.addDrawable(mom);
  }

  public void draw() {
    pushStyle();
    
    tiger.update();
    
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }

    if (tiger.isMouseOver()) {
      loadNextScene();
    }
  }
}
