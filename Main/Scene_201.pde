public class Scene_201 extends BaseScene {
  @Override
    public int getPreviousScene() {
    return 114;
  }

  @Override
    public int getNextScene() {
    return 202;
  }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("16", drawManager);

    var ground = new Ground(0, 500, width, height, 0, #DAC4A2);
    drawManager.addDrawable(ground);


    var house = objectFactory.create("res/images/object/hut_front.png");
    house.setPosition(1000, 50);
    house.setScale(0.4, 0.4);
    drawManager.addDrawable(house);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.knock);
    tiger.setPosition(800, 500);
    tiger.setScale(0.52, 0.52);
    drawManager.addDrawable(tiger);

    soundManager.playOnce("res/sound/effect/201_발자국소리.mp3");
    try {
      Thread.sleep(5000);
    }
    catch (InterruptedException e) {
    }
    soundManager.playOnce("res/sound/effect/201_노크소리.mp3");
  }

  public void draw() {
    pushStyle();
    background(#cfe2f3);

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
