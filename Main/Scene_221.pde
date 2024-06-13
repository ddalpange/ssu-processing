public class Scene_221 extends BaseScene {
  @Override
  public int getPreviousScene() { return 220; }

  @Override
  public int getNextScene() { return 222; }
  public void setup() {
	uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    
    loadBackground("20", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.angry);
    // 호랑이 위치 조정
    tiger.setPosition(width / 2, height - 160);
    tiger.setScale(0.8, 0.8);
    drawManager.addDrawable(tiger);

    // 화내는 씬에 떡 바구니 없는 것이 더 자연스러울 것 같아 지움
    // var riceCake = objectFactory.create("res/images/object/ricecake_01_02.png");
    // riceCake.setPosition(width / 2, height - 255);
    // riceCake.setScale(1.5f, 1.5f);
    // drawManager.addDrawable(riceCake);
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
