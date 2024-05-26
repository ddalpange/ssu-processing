public class Scene_213 extends BaseScene {
  @Override
  public int getNextScene() { return 214; }
  public void setup() {
    uiManager.dialogUi.push(uiManager.getDialogDataById("213001"));
    uiManager.dialogUi.push(uiManager.getDialogDataById("213002"));
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
