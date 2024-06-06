void Scene_211_Family_Setup(DrawManager drawManager) {
  var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.smile);
  mom.setPosition(130, 500);
  mom.setScale(1.2f, 1.2f);
  drawManager.addDrawable(mom);

  var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.front);
  boy.setPosition(300, 550);
  boy.setScale(0.7f, 0.7f);
  drawManager.addDrawable(boy);

  var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.front);
  girl.setPosition(450, 600);
  girl.setScale(0.7f, 0.7f);
  drawManager.addDrawable(girl);
}

public class Scene_211 extends BaseScene {
  @Override
  public int getPreviousScene() { return 210; }

  @Override
  public int getNextScene() { return 212; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("25", drawManager);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_03);
    tiger.setPosition(width / 2 + 200, 450);
    tiger.setScale(-1, 1);
    drawManager.addDrawable(tiger);
    
    var candle = new Candle(width / 2 + 5, 142);
    drawManager.addDrawable(candle);
    
    // var needle = new Needle(width / 2 + 50, 500);
    // needle.setScale(0.5, 0.5); 
    // drawManager.addDrawable(needle);

    Scene_211_Family_Setup(drawManager);
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
