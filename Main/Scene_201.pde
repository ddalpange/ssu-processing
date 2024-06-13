public class Scene_201 extends BaseScene {
  @Override
    public int getPreviousScene() {
    return 114;
  }

  @Override
    public int getNextScene() {
    return 202;
  }

  private float elapsed = 0;
  private boolean knockSoundPlayed = false;
  private boolean dialogShowed = false;

  public void setup() {
    loadBackground("16", drawManager);

    var ground = new Ground(0, 500, width, height, 0, #DAC4A2);
    drawManager.addDrawable(ground);

    // 안 쓰는 집 코드 삭제
    // var house = objectFactory.create("res/images/object/hut_front.png");
    // house.setPosition(1000, 50);
    // house.setScale(0.4, 0.4);
    // drawManager.addDrawable(house);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.knock);
    tiger.setPosition(800, 500);
    tiger.setScale(0.52, 0.52);
    drawManager.addDrawable(tiger);

    soundManager.playOnce("res/sound/effect/201_발자국소리.mp3");
  }

  public void draw() {
    pushStyle();
    background(#cfe2f3);

    drawManager.drawing();
    uiManager.drawing();

    elapsed += deltaTime;
    if (elapsed > 5 && knockSoundPlayed == false) {
      knockSoundPlayed = true;
      soundManager.playOnce("res/sound/effect/201_노크소리.mp3");
    }
    if (elapsed > 7 && dialogShowed == false) {
      dialogShowed = true;
      uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
      uiManager.dialogUi.next();
    }

    popStyle();
  }

  public void mousePressed() {
    if (dialogShowed == false) {
      return;
    }
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
