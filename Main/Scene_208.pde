public class Scene_208 extends BaseScene {
  @Override
  public int getPreviousScene() { return 207; }

  @Override
  public int getNextScene() { return 209; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("23", drawManager);

    Scene_202_bg_setup(drawManager);
    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_02);
    tiger.setPosition(width / 2 + 212, 460);
    tiger.setScale(-0.71f, 0.71f);
    drawManager.addDrawable(tiger);

    var candle = new Candle(width / 2 + 5, 142);
    drawManager.addDrawable(candle);

    var knife = objectFactory.create("res/images/object/knife.png");
    knife.setPosition(800, 350);
    // 칼 돌려야 할듯.. 근데 돌리면 안보임
    knife.setScale(-0.85f, 0.85f);
    drawManager.addDrawable(knife);

    //effectManager.addParticles(width / 2, 600, EffectType.BLOOD);
  }
   float sleepEffectRemainSeconds = 0;
  public void draw() {
    pushStyle();
    sleepEffectRemainSeconds -= deltaTime;
    if (sleepEffectRemainSeconds < 0) {
      sleepEffectRemainSeconds = 1f;
      effectManager.addParticles(width / 2 + 440, 340, EffectType.SLEEP);
    }
    background(#FFFFFF);
    drawManager.drawing();
    uiManager.drawing();
    effectManager.updateAndDraw();
    
    popStyle();
  }

  int clickCount = 0;
  

  public void mousePressed() {
    

    if (clickCount == 0) {
      effectManager.addParticles(width / 2+20,  height /2, EffectType.BLOOD);
      clickCount++;
    
      var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.left_half);
      translate(width/2, height/2);
      rotateZ(PI/3.0);
      
      mom.setPosition(width / 2 + 212, 290);
      mom.setScale(0.5f, 0.5f);
      drawManager.addDrawable(mom);
      
      var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb);
      boy.setPosition(300, 700);
      boy.setScale(0.7f, 0.7f)  ;
      drawManager.addDrawable(boy);

      var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb);
      girl.setPosition(width/2 + 300, 700);
      girl.setScale(0.7f, 0.7f);
      drawManager.addDrawable(girl);

    } else {
      if (uiManager.dialogUi.next()) {
        return;
      }
      loadNextScene();
    }
  }
}
