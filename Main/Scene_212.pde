public class Scene_212 extends BaseScene {
  @Override
    public int getPreviousScene() {
    return 211;
  }

  @Override
    public int getNextScene() {
    return 213;
  }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("27-1", drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_03);
    tiger.setPosition(width / 2 -160, 280);
    tiger.setScale(0.9f, 0.9f);
    drawManager.addDrawable(tiger);

    loadBackground("27-2", drawManager);

    // Drawable openDoor = new OpenDoor(width / 2 + 300, height / 2);
    // drawManager.addDrawable(openDoor);

    // Scene_211_Family_Setup(drawManager);

    var mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.front);
    mom.setPosition(width/2 + 130, 500);
    mom.setScale(0.7f, 0.7f);
    drawManager.addDrawable(mom);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.front);
    boy.setPosition(width/2+300, 550);
    boy.setScale(0.7f, 0.7f);
    drawManager.addDrawable(boy);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.front);
    girl.setPosition(width/2+450, 600);
    girl.setScale(0.7f, 0.7f);
    drawManager.addDrawable(girl);

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
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
