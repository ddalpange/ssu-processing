public class Scene_219 extends BaseScene {
  @Override
  public int getPreviousScene() { return 218; }

  @Override
  public int getNextScene() { return 220; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("20", drawManager);

    var tiger = objectFactory.createAnimation(CharacterType.tiger, "ricecake01eat", 3);
    tiger.playNTimes(4, 1);
    // 호랑이 위치 조정
    tiger.setPosition(width / 2, height - 60);
    tiger.setScale(2, 2);
    drawManager.addDrawable(tiger);

    var riceCake = objectFactory.create("res/images/object/ricecake_01_02.png");
    // 바구니 위치 조정
    riceCake.setPosition(width / 2, height - 255);
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
