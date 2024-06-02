// 호랑이가 참기름과 도끼를 선택하는 상황
// 참기름 선택시 현재 씬으로 다시 돌아옴
public class Scene_308 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 309; }
  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("45", drawManager);


    var oil = objectFactory.create("res/images/objects/oil.png");
    oil.setPosition(200, 200);
    drawManager.addDrawable(oil);

    var axe = new Axe(700, -350);
    axe.d_rotate(90);
    drawManager.addDrawable(axe);

    var tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.back);
    tiger.setPosition(600, 500);
    tiger.setScale(0.3, 0.3);
    drawManager.addDrawable(tiger);
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
