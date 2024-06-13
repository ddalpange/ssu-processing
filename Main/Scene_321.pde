public class Scene_321 extends BaseScene {
  @Override
  public int getPreviousScene() { return 320; }

  @Override
  public int getNextScene() { return 322; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("58", drawManager);

    // 배경, 나무, 도끼 필요
    
    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(400, 120);
    goldRope.setScale(0.09, 0.09);
    drawManager.addDrawable(goldRope);
    
    var cloud1 = objectFactory.create("res/images/object/cloud.png");
    cloud1.setPosition(200, 150);
    cloud1.setScale(0.45, 0.45);
    drawManager.addDrawable(cloud1);
    var anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 6, 1.5, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    var cloud2 = objectFactory.create("res/images/object/cloud2.png");
    cloud2.setPosition(900, 70);
    cloud2.setScale(0.3, 0.3);
    drawManager.addDrawable(cloud2);
    anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 9, 1.8, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.pray);
    tiger.setPosition(580, 390);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);
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
