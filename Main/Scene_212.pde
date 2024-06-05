public class Scene_212 extends BaseScene {
  @Override
  public int getPreviousScene() { return 211; }

  @Override
  public int getNextScene() { return 213; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("27-1", drawManager);

    // 호랑이 배에 꼬매진 자국이 없는데?
    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_02);
    tiger.setPosition(width / 2 -50, 240);
    tiger.setScale(0.45f, 0.45f);
    drawManager.addDrawable(tiger);

    loadBackground("27-2", drawManager);

    // Drawable openDoor = new OpenDoor(width / 2 + 300, height / 2);
    // drawManager.addDrawable(openDoor);

    Scene_211_Family_Setup(drawManager);

    soundManager.playOnce("res/sound/effect/207.210.212_잠자는소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    background(#F5E8A8);
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
