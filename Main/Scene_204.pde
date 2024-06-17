// 호랑이에게 팥떡이나 쑥떡을 주는 게임
public class Scene_204 extends BaseScene {
  GhostLegGameManager gameManager;

  @Override
  public int getPreviousScene() { return 203; }

  // 팥 떡 분기
  //@Override
  //public int getNextScene() { return 205; }

  // 쑥 떡 분기
  @Override
  public int getNextScene() { return 218; }


  Drawable 팥떡;
  Drawable 쑥떡;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("19", drawManager);

    팥떡 = objectFactory.create("res/images/object/ricecake_02_02.png");
    팥떡.setPosition(350, 250);
    팥떡.setScale(1.4, 1.4);
    drawManager.addDrawable(팥떡);

    쑥떡 = objectFactory.create("res/images/object/ricecake_01_02.png");
    쑥떡.setPosition(950, 250);
    쑥떡.setScale(1.4, 1.4);
    drawManager.addDrawable(쑥떡);

    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.point);
    boy.setPosition(width / 2 - 170, 710);
    boy.setScale(0.8f, 0.8f);
    drawManager.addDrawable(boy);

    gameManager = new GhostLegGameManager(2, new int[] {205, 218}, new Drawable[]{팥떡, 쑥떡});
  }
 
  public void draw() {
    pushStyle();
    
    팥떡.update();
    쑥떡.update();
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    gameManager.update();
    soundManager.playOnce("res/sound/effect/303.308_미니게임클릭소리.mp3");
    if (uiManager.dialogUi.next()) {
      return;
    }
  }
}