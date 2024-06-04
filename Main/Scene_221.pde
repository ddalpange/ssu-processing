public class Scene_221 extends BaseScene {
  @Override
  public int getPreviousScene() { return 220; }

  @Override
  public int getNextScene() { return 222; }
  public void setup() {
	uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    
    loadBackground("20", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.angry);
    tiger.setPosition(width / 2, height);
    tiger.setScale(1, 1);
    drawManager.addDrawable(tiger);

    var riceCakeBasket = objectFactory.create("res/images/object/ricecake_01_02.png");
    riceCakeBasket.setPosition(width / 2, height - 120);
    riceCakeBasket.setScale(2, 2);
    drawManager.addDrawable(riceCakeBasket);
  }
 
  public void draw() {
    pushStyle();
    
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
