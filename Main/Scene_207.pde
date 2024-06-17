public class Scene_207 extends BaseScene {
  @Override
  public int getPreviousScene() { return 206; }

  @Override
  public int getNextScene() { return 208; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("22", drawManager);


    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_01);
    tiger.setPosition(width / 2 + 200, 450);
    tiger.setScale(-1, 1);
    drawManager.addDrawable(tiger);

    var candle = new Candle(width / 2 + 5, 142);
    drawManager.addDrawable(candle);

    soundManager.playOnce("res/sound/effect/207.210.212_잠자는소리.mp3");
  }
 
  float sleepEffectRemainSeconds = 0;
  public void draw() {
    pushStyle();
    sleepEffectRemainSeconds -= deltaTime;
    if (sleepEffectRemainSeconds < 0) {
      sleepEffectRemainSeconds = 1f;
      effectManager.addParticles(width / 2 + 440, 340, EffectType.SLEEP);
    }
    drawManager.drawing();
    uiManager.drawing();
    effectManager.updateAndDraw();
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
