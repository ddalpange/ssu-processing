// 새 동아줄을 잡은 오누이는 올라가기 시작함. 호랑이가 나무에서 오누이를 바라봄.
public class Scene_320 extends BaseScene {
  @Override
  public int getPreviousScene() { return 319; }

  @Override
  public int getNextScene() { return 321; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    loadBackground("57", drawManager);

    var cloud1 = objectFactory.create("res/images/object/cloud.png");
    cloud1.setPosition(150, 100);
    cloud1.setScale(0.25, 0.25);
    drawManager.addDrawable(cloud1);
    var anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 2, 1.5, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    var cloud2 = objectFactory.create("res/images/object/cloud2.png");
    cloud2.setPosition(500, 80);
    cloud2.setScale(0.2, 0.2);
    drawManager.addDrawable(cloud2);
    anim = new MoveAnimation(cloud2, cloud2.x, cloud2.y + 3, 1.8, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    cloud1 = objectFactory.create("res/images/object/cloud.png");
    cloud1.setPosition(750, 130);
    cloud1.setScale(0.25, 0.25);
    drawManager.addDrawable(cloud1);
    anim = new MoveAnimation(cloud1, cloud1.x, cloud1.y - 2, 1.5, EaseType.InOutBack);
    anim.repeatCount = -1;
    startAnimation(anim);

    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(260, 200);
    goldRope.setScale(0.12, 0.12);
    drawManager.addDrawable(goldRope);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(1200, 400);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);

    startAnimation(new MoveAnimation(goldRope, 260, 110 - 300, 16, EaseType.OutCirc));
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
