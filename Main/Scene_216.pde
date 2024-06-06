public class Scene_216 extends BaseScene {
  @Override
  public int getPreviousScene() { return 215; }

  @Override
  public int getNextScene() { return 217; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("30", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.well);
    // tiger.setPosition(470, 550);
    // tiger.setScale(0.6f, 0.6f);
    tiger.setPosition(width / 2 + 180, 340);
    tiger.setScale(0.4f, 0.4f);
    drawManager.addDrawable(tiger);

    // TODO: 타이밍 조절해야 할 듯?
    try {
      Thread.sleep(5000);
    }
    catch (InterruptedException e) {
    }
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
