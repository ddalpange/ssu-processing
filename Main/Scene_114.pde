public class Scene_114 extends BaseScene {
  @Override
  public int getPreviousScene() { return 113; }

  @Override
  public int getNextScene() { return 201; }
  
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("15-1", drawManager);

    var tiger = objectFactory.createAnimation(CharacterType.tiger_mom, "back_run", 2);

    float animDuration = 5;
    float spriteAnimCycle = 1f;
    tiger.playNTimes(spriteAnimCycle, (int)(animDuration / spriteAnimCycle));
    tiger.setPosition(700, 450);
    tiger.setScale(0.5, 0.5);
    drawManager.addDrawable(tiger);

    startAnimation(new MoveAnimation(tiger, tiger.x + 150, tiger.y - 80, animDuration, EaseType.Linear));
    startAnimation(new ScaleAnimation(tiger, tiger.scale.x * 0.6, tiger.scale.y * 0.6, animDuration, EaseType.Linear));


    loadBackground("15-2", drawManager);

    soundManager.playOnce("res/sound/effect/114_발자국소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();
    animationManager.update();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
