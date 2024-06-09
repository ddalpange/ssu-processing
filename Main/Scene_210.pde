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
    tiger.setPosition(width / 2 + 208, 460);
    tiger.setScale(-0.7f, 0.7f);
    drawManager.addDrawable(tiger);

    var stones = objectFactory.create("res/images/object/stones.png");
    stones.setPosition(width / 2 + 212, 360);
    stones.setScale(0.3f, 0.3f);
    drawManager.addDrawable(stones);


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
