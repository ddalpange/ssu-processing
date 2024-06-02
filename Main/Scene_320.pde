// 새 동아줄을 잡은 오누이는 올라가기 시작함. 호랑이가 나무에서 오누이를 바라봄.
public class Scene_320 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 321; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    loadBackground("57", drawManager);


    // 배경, 마을, 나무 필요


    // 리소스 교체 필요
    // var rope = objectFactory.create("res/images/objects/rope_new.png");
    // rope.setPosition(400, 50);
    // rope.setScale(0.03, 0.03);
    // drawManager.addDrawable(rope);

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
    boy.setPosition(380, 100);
    boy.setScale(0.1, 0.1);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope);
    girl.setPosition(420, 100);
    girl.setScale(-0.1, 0.1);
    drawManager.addDrawable(girl);

    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.climb);
    tiger.setPosition(1000, 300);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
