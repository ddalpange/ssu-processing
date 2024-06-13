public class Scene_215 extends BaseScene {
  @Override
  public int getPreviousScene() { return 214; }

  @Override
  public int getNextScene() { return 216; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("30", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.thirsty);
    tiger.setPosition(width / 2, 360);
    tiger.setScale(0.4f, 0.4f);
    drawManager.addDrawable(tiger);


    // var 우물 = objectFactory.create("res/images/object/well.png");
    // 우물.setPosition(200, 500);
    // 우물.setScale(0.4, 0.4);
    // drawManager.addDrawable(우물);

    // 배경 나중에


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
