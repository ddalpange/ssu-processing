public class Scene_222 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 301; }

  private PVector tigerPos = new PVector(300,400);
  private PVector boyPos = new PVector(800,400);
  private PVector girlPos = new PVector(900,400);

  private ShapeObject tiger;
  private ShapeObject boy;
  private ShapeObject girl;

  private void SetUpObject()
  {
   tiger = objectFactory.create(CharacterType.tiger_mom, CharacterPoseType.left);
   tiger.setPosition(tigerPos.x,tigerPos.y);
   tiger.setScale(0.5f,0.5f);
    boy = objectFactory.create(CharacterType.boy, CharacterPoseType.climb_rope);
   boy.setPosition(boyPos.x,boyPos.y);
    girl = objectFactory.create(CharacterType.girl, CharacterPoseType.climb_rope); 
   girl.setPosition(girlPos.x,girlPos.y);
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
    uiManager.drawing();
    
    popStyle();
  }

  void DrawObject()
  {
    tiger.drawImage();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
