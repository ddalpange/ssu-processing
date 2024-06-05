void Scene_211_Family_Setup(DrawManager drawManager) {
  var mom = objectFactory.create(CharacterType.mom, CharacterPoseType.front);
  mom.setPosition(150, 650);
  mom.setScale(0.6f, 0.6f);
  drawManager.addDrawable(mom);

  var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.front);
  boy.setPosition(300, 650);
  boy.setScale(0.6f, 0.6f);
  drawManager.addDrawable(boy);

  var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.front);
  girl.setPosition(450, 700);
  girl.setScale(0.6f, 0.6f);
  drawManager.addDrawable(girl);
}

public class Scene_211 extends BaseScene {
  @Override
  public int getPreviousScene() { return 210; }

  @Override
  public int getNextScene() { return 212; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("25", drawManager);


    // 호랑이 배에 꼬매진 자국이 없는데?
    var tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.lay_03);
    tiger.setPosition(width / 2 + 150, 300);
    tiger.setScale(-1f, 1f);
    drawManager.addDrawable(tiger);


    var needle = new Needle(width / 2 + 50, 50);
    needle.setScale(0.2, 0.2); // scale이 안먹는듯?
    drawManager.addDrawable(needle);

    Scene_211_Family_Setup(drawManager);
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
