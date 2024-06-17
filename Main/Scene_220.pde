public class Scene_220 extends BaseScene {
  @Override
  public int getPreviousScene() { return 219; }

  @Override
  public int getNextScene() { return 221; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("20", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.ricecake_03_01);
    // 호랑이 위치 조정
    tiger.setPosition(width / 2, height - 160);
    tiger.setScale(0.8, 0.8);
    drawManager.addDrawable(tiger);

    var riceCakeBasket = objectFactory.create("res/images/object/ricecake_01_02.png");
    // 바구니 위치 조정
    riceCakeBasket.setPosition(width / 2, height - 255);
    riceCakeBasket.setScale(1.5f, 1.5f);
    drawManager.addDrawable(riceCakeBasket);

    var riceCake = objectFactory.create("res/images/object/ricecake_01_01.png");
    // 먹뱉 떡 위치 조정
    riceCake.setPosition(width / 2 - 180, height /2);
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
