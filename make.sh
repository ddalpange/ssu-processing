for i in {10..33}; do touch Scene_3$i.pde; echo "public class Scene_3$i extends BaseScene {
  public void setup() {
    println("Scene_3$i : setup");
  }
 
  public void draw() {
    pushStyle();
    
    background(255, 0, 0);
    //println("Scene_3$i : draw");
    
    popStyle();
  }
  
  public void mousePressed() {
    println("Scene_3$i : mousePressed");
  }
}
" > Scene_3$i.pde; done

