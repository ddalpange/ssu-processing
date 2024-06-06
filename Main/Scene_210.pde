public class Scene_210 extends BaseScene {
  @Override
  public int getPreviousScene() { return 209; }

  @Override
  public int getNextScene() { return 211; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("25", drawManager);


    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_02);
    // tiger.setPosition(width / 2, 500);
    tiger.setPosition(width / 2 + 200, 390);
    tiger.setScale(-0.5f, 0.5f);
    drawManager.addDrawable(tiger);

    // drawManager.addDrawable(new Rock1(300f, 300f, #c0c0c0));
    // drawManager.addDrawable(new Rock1(350f, 300f, #c0c0c0));
    // drawManager.addDrawable(new Rock1(400f, 300f, #c0c0c0));
    // drawManager.addDrawable(new Rock1(450f, 300f, #c0c0c0));
    // drawManager.addDrawable(new Rock1(500f, 300f, #c0c0c0));
    // drawManager.addDrawable(new Rock1(550f, 300f, #c0c0c0));

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
      effectManager.addParticles(width / 2 + 250, 350, EffectType.SLEEP);
    }
    
    drawManager.drawing();
    effectManager.updateAndDraw();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
