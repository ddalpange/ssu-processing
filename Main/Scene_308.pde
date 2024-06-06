// 호랑이가 참기름과 도끼를 선택하는 상황
// 참기름 선택시 현재 씬으로 다시 돌아옴
public class Scene_308 extends BaseScene {
  @Override
  public int getPreviousScene() { return 307; }

  @Override
  public int getNextScene() { return 309; }

  GhostLegGameManager gameManager;

  Drawable oil;
  Drawable axe;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("45", drawManager);


    // 회전시키면 마우스 호버랑 위치가 이상해짐;; 일단 패스
    oil = objectFactory.create("res/images/object/oil.png");
    oil.setPosition(250, 200);
    //oil.d_rotate(30);
    drawManager.addDrawable(oil);

    var questionMark = objectFactory.create("res/images/UI/green_question.png");
    questionMark.setPosition(800, 270);
    questionMark.setScale(1, 1);
    drawManager.addDrawable(questionMark);

    axe = objectFactory.create("res/images/object/axe.png");
    axe.setPosition(1050, 200);
    //axe.d_rotate(30);
    drawManager.addDrawable(axe);


    gameManager = new GhostLegGameManager(2, new int[] {308, 309}, new Drawable[]{oil, axe});

    var tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.back);
    tiger.setPosition(600, 600);
    tiger.setScale(0.6, 0.6);
    drawManager.addDrawable(tiger);
  }
 
  public void draw() {
    pushStyle();
    
    oil.update();
    axe.update();
    
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
