// 동아줄이 끊어져 떨어지는 오누이와 바라보는 호랑이
public class Scene_317 extends BaseScene {
  @Override
  public int getPreviousScene() { return 316; }

  @Override
  public int getNextScene() { return 318; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("54", drawManager);
  
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

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.fall_purple);
    boy.setPosition(120, -400);
    boy.setScale(0.3, 0.3);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.fall_purple);
    girl.setPosition(400, -400);
    girl.setScale(0.3, 0.3);
    drawManager.addDrawable(girl);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(1000, 300);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);

    // 구름 별 마을 필요
    startAnimation(new MoveAnimation(boy, 120, 280, 10, EaseType.OutCubic));

    startAnimation(new MoveAnimation(girl, 400, 340, 10, EaseType.OutCubic));
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
