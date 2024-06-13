// 어머니가 밤길에 떡을 지고 돌아가는 장면
public class Scene_106 extends BaseScene {
  @Override
  public int getPreviousScene() { return 105; }

  @Override
  public int getNextScene() { return 107; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("7", drawManager);


    var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.back_ricecake);
    mom.setPosition(850, 430);
    mom.setScale(0.5, 0.5);
    drawManager.addDrawable(mom);

    soundManager.playOnce("res/sound/effect/106_부엉이아니고올빼미소리.mp3");
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
    loadNextScene();
  }
}
