public class Scene_105 extends BaseScene {
  @Override
  public int getPreviousScene() { return 104; }

  @Override
  public int getNextScene() { return 106; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("6", drawManager);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.smile);
    boy.setPosition(450, 500);
    //boy.setScale(2f, 2f);
    drawManager.addDrawable(boy);
    
    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.smile);
    girl.setPosition(800, 600);
    //girl.setScale(2f, 2f);
    drawManager.addDrawable(girl);

    var riceCake1 = objectFactory.create("res/images/object/ricecake_01_02.png");
    riceCake1.setPosition(width / 2 + 170, height - 200);
    riceCake1.setScale(1.1f, 1.1f);
    drawManager.addDrawable(riceCake1);

    var riceCake2 = objectFactory.create("res/images/object/ricecake_02_02.png");
    riceCake2.setPosition(width / 2 - 200, height - 230);
    riceCake2.setScale(1.2f, 1.2f);
    drawManager.addDrawable(riceCake2);
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
