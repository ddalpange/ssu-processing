void Scene_108_background_setup(DrawManager drawManager) {
  // var bg = objectFactory.create("res/images/object/tiger_in_the_dark_bg_4.png");
  // bg.setPosition(width / 2, height / 2);
  // bg.setScale(0.26, 0.26);
  // drawManager.addDrawable(bg);
}

void Scene_108_background_setup2(DrawManager drawManager) {
  // var bg2 = objectFactory.create("res/images/object/tiger_in_the_dark_bg_5.png");
  // bg2.setPosition(width / 2, height / 2);
  // bg2.setScale(0.26, 0.26);
  // drawManager.addDrawable(bg2);
}

public class Scene_108 extends BaseScene {
  @Override
  public int getPreviousScene() { return 107; }

  @Override
  public int getNextScene() { return 109; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("9-1", drawManager);
    
    Scene_108_background_setup(drawManager);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.threat);
    tiger.setPosition(250, 500);
    tiger.setScale(0.5, 0.5);
    drawManager.addDrawable(tiger);

    loadBackground("9-2", drawManager);

    Scene_108_background_setup2(drawManager);

    var mom = objectFactory.createCombination(CharacterType.mom, CharacterPoseType.back_ricecake);
    mom.setPosition(950, 650);
    mom.setScale(0.7, 0.7);
    drawManager.addDrawable(mom);
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
