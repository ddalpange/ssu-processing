// 호랑이가 참기름과 도끼를 선택하는 상황
// 참기름 선택시 현재 씬으로 다시 돌아옴
public class Scene_308 extends BaseScene {
  @Override
  public int getNextScene() { return 309; }
  public void setup() {
    uiManager.dialogUi.push(uiManager.getDialogDataById("308001"));
  }
 
  public void draw() {
    pushStyle();
    
    background(255, 0, 0);
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
