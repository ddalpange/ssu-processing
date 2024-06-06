public class Scene_330 extends BaseScene {
  @Override
  public int getPreviousScene() { return 329; }

  @Override
  public int getNextScene() { return -1; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("67", drawManager);

    var cloud1 = new Cloud_Normal(width / 2 - 600, 500);
    drawManager.addDrawable(cloud1);

    var cloud2 = new Cloud_Normal(width / 2 + 100, 500);
    drawManager.addDrawable(cloud2);

    var sun = objectFactory.create("res/images/object/sun.png");
    sun.setPosition(width/4, 250);
    sun.setScale(0.55f, 0.55f);
    drawManager.addDrawable(sun);

    var moon = objectFactory.create("res/images/object/moon.png");
    moon.setPosition(width/4 * 3, 250);
    moon.setScale(-0.5f, 0.5f);
    drawManager.addDrawable(moon);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.seat);
    girl.setPosition(width / 2 - 300, 500);
    girl.setScale(-0.6, 0.6);
    drawManager.addDrawable(girl);
    
    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.seat);
    boy.setPosition(width / 2 + 300, 500);
    boy.setScale(0.6, 0.6);
    drawManager.addDrawable(boy);

    soundManager.playOnce("res/sound/effect/330_빛내려오는효과음.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    
    sceneManager.loadScene(new Scene_Ending());
  }
}
