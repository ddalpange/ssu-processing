public class Scene_222 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 301; }

  private PVector tigerPos = new PVector(300,400);
  private PVector boyPos = new PVector(800,400);
  private PVector girlPos = new PVector(950,400);

  private ShapeObject tiger;
  private ShapeObject boy;
  private ShapeObject girl;

  private MoveAnimation tigerMoveAnimation;
  private MoveAnimation boyMoveAnimation;
  private MoveAnimation girlMoveAnimation;

  private boolean isNeedToMove = false;
  private final float kidsMoveDuration = 2f;
  private final float imageBuffer = 200;
  private final float tigerMoveDuration = 4f;

  private void SetUpObject()
  {
   tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.left);
   tiger.setPosition(tigerPos.x,tigerPos.y);
   tiger.setScale(0.5f,0.5f);
    tigerMoveAnimation = new MoveAnimation(tiger, width/2, 400, tigerMoveDuration);

    boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
   boy.setPosition(boyPos.x,boyPos.y);
   boy.setScale(0.5f,0.5f);
    boyMoveAnimation = new MoveAnimation(boy, width + imageBuffer, 400, kidsMoveDuration);
   
    girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope); 
   girl.setPosition(girlPos.x,girlPos.y);
   girl.setScale(0.5f,0.5f);
    girlMoveAnimation = new MoveAnimation(girl, width + 150 + imageBuffer, 400, kidsMoveDuration);
  }

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    SetUpObject();
    loadBackground("37", drawManager);
  }
 
  public void draw() {
    pushStyle();
    
    drawManager.drawing();
    DrawObject();
    animationManager.update();

    uiManager.drawing();
    
    popStyle();
  }

  void DrawObject()
  {
    tiger.drawImage();
    if(isNeedToMove)
    {
      boy.drawImage();
      girl.drawImage();
    }
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      {
        //대사가 단 두개 밖에 없다는게 전제라 이런 동작을 사용한다.
        startAnimation(boyMoveAnimation);
        startAnimation(girlMoveAnimation);
        isNeedToMove = true;
      } 
      return;
    }
    loadNextScene();
  }
}
