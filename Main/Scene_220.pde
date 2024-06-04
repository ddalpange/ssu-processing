public class Scene_220 extends BaseScene {
  @Override
  public int getPreviousScene() { return 219; }

  @Override
  public int getNextScene() { return 221; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("20", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.ricecake_03_01);
    tiger.setPosition(width / 2, height);
    tiger.setScale(1, 1);
    drawManager.addDrawable(tiger);

    var riceCakeBasket = objectFactory.create("res/images/object/ricecake_01_02.png");
    riceCakeBasket.setPosition(width / 2, height - 120);
    riceCakeBasket.setScale(2, 2);
    drawManager.addDrawable(riceCakeBasket);

    var riceCake = objectFactory.create("res/images/object/ricecake_01_01.png");
    riceCake.setPosition(335, 406);
    riceCake.setScale(1.5f, 1.5f);
    drawManager.addDrawable(riceCake);
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
