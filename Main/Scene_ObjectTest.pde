public class Scene_ObjectTest extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  ShapeObject tiger;
  public void setup() {
    println("Scene_ObjectTest : setup");
    tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.front);
    tiger.setPosition(200, 200);
    tiger.scale.x = 0.2;
    tiger.scale.y = 0.2;
    drawManager.addDrawable(tiger);
  }
 
  public void draw() {
    pushStyle();
    
    
    //println("Scene_ObjectTest : draw");
    drawManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    println("Scene_ObjectTest : mousePressed");
  }
}
