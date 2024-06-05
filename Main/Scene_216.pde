public class Scene_216 extends BaseScene {
  @Override
  public int getPreviousScene() { return 215; }

  @Override
  public int getNextScene() { return 217; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("30", drawManager);


    // var 우물 = objectFactory.create("res/images/object/well.png");
    // 우물.setPosition(450, 400);
    // 우물.setScale(0.5, 0.5);
    // drawManager.addDrawable(우물);


    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.well);
    tiger.setPosition(470, 550);
    tiger.setScale(0.6f, 0.6f);
    drawManager.addDrawable(tiger);

    // 배경 나중에

    // TODO: 타이밍 조절해야 할 듯?
    soundManager.playOnce("res/sound/effect/216_으아아소리.mp3");
    soundManager.playOnce("res/sound/effect/216_풍덩소리.mp3");
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
