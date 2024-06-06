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

    // 리소스 교체 필요
    // var rope = objectFactory.create("res/images/object/rope_strong.png");
    // rope.setPosition(260, 410);
    // rope.setScale(0.1, 0.1);
    // drawManager.addDrawable(rope);

    // var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    // boy.setPosition(210, 430);
    // boy.setScale(0.3, 0.3);
    // drawManager.addDrawable(boy);

    // var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    // girl.setPosition(300, 780);
    // girl.setScale(-0.3, 0.3);
    // drawManager.addDrawable(girl);

    var goldRope = objectFactory.create("res/images/character/gold rope handing.png");
    goldRope.setPosition(260, 200);
    goldRope.setScale(0.12, 0.12);
    drawManager.addDrawable(goldRope);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(1200, 400);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);

    startAnimation(new MoveAnimation(goldRope, 260, 110 - 300, 16, EaseType.OutCirc));
    // startAnimation(new MoveAnimation(rope, 260, 110 - 300, 16, EaseType.OutCirc));
    // startAnimation(new MoveAnimation(boy, 210, 130 - 300, 16, EaseType.OutCirc));
    // startAnimation(new MoveAnimation(girl,300, 380 - 300, 16, EaseType.OutCirc));
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
