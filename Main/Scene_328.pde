public class Scene_328 extends BaseScene {
  @Override
  public int getNextScene() { return 329; }
  public void setup() {
    println("Scene_328 : setup");
  }
 
  public void draw() {
    pushStyle();
    
    background(255, 0, 0);
    println("Scene_328 : draw");
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
