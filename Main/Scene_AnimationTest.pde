public class Scene_AnimationTest extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  private SpriteAnimation testAnim;
  public void setup() {
    var boy = objectFactory.createCombination(CharacterType.boy, CharacterPoseType.front);
    boy.setPosition(350, 600);
    boy.setScale(1f, 1f);
    drawManager.addDrawable(boy);

    var moveAnim = new MoveAnimation(boy);
    moveAnim.easeType = EaseType.InOutQuad;
    moveAnim.destX = boy.x + 500;
    moveAnim.destY = boy.y + 300;
    moveAnim.duration = 3;
    moveAnim.repeatCount = 2;
    startAnimation(moveAnim);

    var girl = objectFactory.createCombination(CharacterType.girl, CharacterPoseType.front);
    girl.setPosition(350, 600);
    girl.setScale(0.5f, 0.5f);
    drawManager.addDrawable(girl);

    var scaleAnim = new ScaleAnimation(girl);
    scaleAnim.easeType = EaseType.InOutBounce;
    scaleAnim.destX = 2;
    scaleAnim.destY = 2;
    scaleAnim.duration = 3;
    scaleAnim.repeatCount = 1;
    startAnimation(scaleAnim);
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    animationManager.update();
    
    popStyle();
  }
  
  public void mousePressed() {
    
  }
}
