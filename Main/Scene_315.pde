public class Scene_315 extends BaseScene {
  @Override
  public int getPreviousScene() { return 314; }

  @Override
  public int getNextScene() { return 316; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("51", drawManager);

    var bronzeRope = objectFactory.create("res/images/character/bronze rope handing.png");
    bronzeRope.setPosition(width/2, 300);
    bronzeRope.setScale(0.3, 0.3);
    drawManager.addDrawable(bronzeRope);

    var cloud1 = objectFactory.create("res/images/object/cloud.png");
    cloud1.setPosition(200, 150);
    cloud1.setScale(0.55, 0.55);
    drawManager.addDrawable(cloud1);
    var anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 6, 1.5, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    var cloud2 = objectFactory.create("res/images/object/cloud2.png");
    cloud2.setPosition(1000, 80);
    cloud2.setScale(0.4, 0.4);
    drawManager.addDrawable(cloud2);
    anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 9, 1.8, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    // 구름, 별, 마을 배경(초가집, 밭) 필요

    soundManager.playOnce("res/sound/effect/315.325_밧줄투욱끊어지는소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
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
