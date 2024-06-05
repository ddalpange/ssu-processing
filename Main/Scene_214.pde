public class Scene_214 extends BaseScene {
  @Override
  public int getPreviousScene() { return 213; }

  @Override
  public int getNextScene() { return 215; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("41", drawManager);

    // Drawable house = objectFactory.create("res/images/object/hut_front.png");
    // house.setPosition(width / 2 + 200, height / 2 - 40);
    // house.setScale(0.13, 0.13);
    // drawManager.addDrawable(house);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.thirsty);
    tiger.setPosition(width / 2 - 200, 600);
    tiger.setScale(0.5f, 0.5f);
    drawManager.addDrawable(tiger);

    // 배경 나중에
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
