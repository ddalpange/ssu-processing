public class Scene_CameraManagerTest extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  ShapeObject tiger;
  public void setup() {
    println("Scene_CameraManagerTest : setup");
    tiger = objectFactory.createCombination(CharacterType.tiger_mom, CharacterPoseType.back);
    tiger.setPosition(700, 500);
    tiger.scale.x = 0.4;
    tiger.scale.y = 0.4;

    drawManager.addDrawable(new Ground(-1, #BF763E));
  }
 
  public void draw() {
    pushStyle();
    
    background(#FFFFFF);
    drawManager.drawing();
    tiger.draw();
    
    popStyle();
  }
  
  public void mousePressed() {
    println("Scene_CameraManagerTest : mousePressed");
    cameraManager.zoom(new PVector(mouseX, mouseY), 2.0, 5000);
  }

  public void keyPressed() {
    println("keyPressed : " + keyCode);
    // UP ARROW
    if (keyCode == 38) {
        println("resetView");
        cameraManager.resetView();
    }
  }
}
