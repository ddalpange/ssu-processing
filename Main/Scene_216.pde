public class Scene_216 extends BaseScene {
  @Override
  public int getPreviousScene() { return 215; }

  @Override
  public int getNextScene() { return 217; }

  private float elapsed = 0;
  private int step = 0;
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("30", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.well_1);
    // tiger.setPosition(470, 550);
    // tiger.setScale(0.6f, 0.6f);
    tiger.setPosition(width / 2 + 30, 340);
    tiger.setScale(-0.4f, 0.4f);
    drawManager.addDrawable(tiger);
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();

    if (step >= 1) {
      elapsed += deltaTime;
      // if (elapsed > 1.5f && step == 1) {
        // 대사의 으악 소리만 써도 될 듯.
      //   soundManager.playOnce("res/sound/effect/216_으아아소리.mp3");
      //   step = 2;
      //   elapsed = 0;
      // }
      if (elapsed > 2f && step == 2) {
        soundManager.playOnce("res/sound/effect/216_풍덩소리.mp3");
        step = 3;
      }
    }

    if (step == 0 && uiManager.dialogUi.current != null && uiManager.dialogUi.current.id.equals("216002")) {
      step = 2;
    }
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
