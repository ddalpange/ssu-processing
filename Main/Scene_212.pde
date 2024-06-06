public class Scene_212 extends BaseScene {
  @Override
  public int getPreviousScene() { return 211; }

  @Override
  public int getNextScene() { return 213; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("27-1", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_03);
    tiger.setPosition(width / 2 -160, 280);
    tiger.setScale(0.9f, 0.9f);
    drawManager.addDrawable(tiger);

    loadBackground("27-2", drawManager);

    // Drawable openDoor = new OpenDoor(width / 2 + 300, height / 2);
    // drawManager.addDrawable(openDoor);

    Scene_211_Family_Setup(drawManager);

    soundManager.playOnce("res/sound/effect/207.210.212_잠자는소리.mp3");
  }
  float sleepEffectRemainSeconds = 0;
  public void draw() {
    pushStyle();
    sleepEffectRemainSeconds -= deltaTime;
    if (sleepEffectRemainSeconds < 0) {
      sleepEffectRemainSeconds = 1f;
      effectManager.addParticles(310, 160, EffectType.SLEEP);
    }
    background(#F5E8A8);
    drawManager.drawing();
    uiManager.drawing();
    effectManager.updateAndDraw();
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
