public class Scene_209 extends BaseScene {
  @Override
  public int getPreviousScene() { return 208; }

  @Override
  public int getNextScene() { return 210; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("24", drawManager);


    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.front);
    boy.setPosition(800, 750);
    boy.setScale(1.2f, 1.2f);
    drawManager.addDrawable(boy);

    var speechBubble = objectFactory.create("res/images/ui/speech-bubble.png");
    speechBubble.setPosition(350, 250);
    speechBubble.setScale(0.55f, 0.55f);
    drawManager.addDrawable(speechBubble);

    var tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.lay_02);
    tiger.setPosition(350, 200);
    tiger.setScale(-0.6f, 0.6f);
    drawManager.addDrawable(tiger);

    var stones = objectFactory.create("res/images/object/stones.png");
    stones.setPosition(350, 140);
    stones.setScale(0.16f, 0.16f);
    drawManager.addDrawable(stones);

    soundManager.playOnce("res/sound/effect/209_아이디어효과음.mp3");
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
