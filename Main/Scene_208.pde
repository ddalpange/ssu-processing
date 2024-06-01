public class Scene_208 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 209; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("23", drawManager);

    Scene_202_bg_setup(drawManager);
    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_02);
    tiger.setPosition(width / 2, 500);
    tiger.setScale(-0.6f, 0.6f);
    drawManager.addDrawable(tiger);

    var candle = new Candle(width / 2 + 5, 142);
    drawManager.addDrawable(candle);

    var knife = objectFactory.create("res/images/object/knife.png");
    knife.setPosition(800, 350);
    // 칼 돌려야 할듯.. 근데 돌리면 안보임
    //knife.d_rotate(90);
    //knife.setScale(0.6f, 0.6f);
    drawManager.addDrawable(knife);
    
    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb);
    boy.setPosition(300, 650);
    boy.setScale(0.6f, 0.6f);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb);
    girl.setPosition(450, 700);
    girl.setScale(0.6f, 0.6f);
    drawManager.addDrawable(girl);

    //effectManager.addParticles(width / 2, 600, EffectType.BLOOD);
  }
 
  public void draw() {
    pushStyle();
    
    background(#FFFFFF);
    drawManager.drawing();
    uiManager.drawing();
    effectManager.updateAndDraw();
    
    popStyle();
  }

  int clickCount = 0;
  
  public void mousePressed() {
    if (clickCount == 0) {
      effectManager.addParticles(width / 2, 550, EffectType.BLOOD);
      clickCount++;
    
      var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.left);
      mom.setPosition(650, 350);
      mom.setScale(0.5f, 0.5f);
      drawManager.addDrawable(mom);
    } else {
      if (uiManager.dialogUi.next()) {
        return;
      }
      loadNextScene();
    }
  }
}
