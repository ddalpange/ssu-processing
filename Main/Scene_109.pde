public class Scene_109 extends BaseScene {
  @Override
  public int getNextScene() { return 110; }
  public void setup() {
    uiManager.dialogUi.push(uiManager.getDialogDataById("109001"));
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
