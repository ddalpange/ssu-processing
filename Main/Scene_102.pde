public class Scene_102 extends BaseScene {
  @Override
  public int getPreviousScene() { return 101; }

  @Override
  public int getNextScene() { return 103; }

  private ShapeObject cloud1;
  private ShapeObject cloud2;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("3", drawManager);

    cloud1 = objectFactory.create("res/images/object/cloud_1.png");
    cloud1.setPosition(200, 100);
    cloud1.setScale(0.6, 0.6);
    drawManager.addDrawable(cloud1);
    var anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 10, 1.5, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    cloud2 = objectFactory.create("res/images/object/cloud_2.png");
    cloud2.setPosition(1000, 80);
    cloud2.setScale(0.6, 0.6);
    drawManager.addDrawable(cloud2);
    anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 15, 1.8, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    var shoes = objectFactory.create("res/images/object/shoes.png");
    shoes.setPosition(480, 550);
    shoes.setScale(0.4, 0.4);
    drawManager.addDrawable(shoes);

    shoes = objectFactory.create("res/images/object/shoes.png");
    shoes.setPosition(550, 555);
    shoes.setScale(-0.3, 0.3);
    drawManager.addDrawable(shoes);

    shoes = objectFactory.create("res/images/object/shoes.png");
    shoes.setPosition(600, 540);
    shoes.setScale(0.3, 0.3);
    drawManager.addDrawable(shoes);

    soundManager.playOnce("res/sound/effect/102_웃음소리.mp3");
  }
 
  public void draw() {
    pushStyle();

    background(colors.day_sky);
    drawManager.drawing();
    animationManager.update();

    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }

    loadNextScene();
  }
}
