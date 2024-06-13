
public class Scene_203 extends BaseScene {
  @Override
  public int getPreviousScene() { return 202; }

  @Override
  public int getNextScene() { return 204; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    
    loadBackground("18", drawManager);

    var candle = new Candle(width / 2 + 5, 142);
    drawManager.addDrawable(candle);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.back);
    boy.setPosition(300, 600);
    boy.setScale(0.6f, 0.6f);
    drawManager.addDrawable(boy);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.back);
    girl.setPosition(450, 650);
    girl.setScale(0.6f, 0.6f);
    drawManager.addDrawable(girl);

    var tiger = objectFactory.createAnimation(CharacterType.tiger_mom, "big", 2);
    tiger.setPosition(800, 400);
    tiger.playInfinite(2);
    //tiger.setScale(0.5f, 0.5f);
    drawManager.addDrawable(tiger);

    // 배경 이미지 위에 문 열린 것처럼 보이도록 네모 그려야 함.
  }
 
  public void draw() {
    pushStyle();
    noStroke();
    
    drawManager.drawing();
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
