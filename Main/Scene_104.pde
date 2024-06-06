// 떡 만들기 미니게임
public class Scene_104 extends BaseScene {
  public HPBar hpBar = new HPBar(20, 20);
  public float hammerZAngle = 60;
  public float hammerMaxAngle = 60;
  public PImage hammerImage;

  public ShapeObject 절구1;
  public ShapeObject 절구2;
  public boolean 절구Flag = false;

  public PImage gaugeBG;
  public PImage gaugeFill;
  public int hitCount;

  public ShapeObject leftArrow;
  public ShapeObject rightArrow;
  public Button2 arrowDescButton;

  @Override
  public int getPreviousScene() { return 103; }

  @Override
  public int getNextScene() { return 105; }

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("5", drawManager);


    절구1 = objectFactory.create("res/images/object/mortar-04.png");
    절구1.setPosition(width / 2, 700);
    절구1.setScale(0.4, 0.4);
    절구2 = objectFactory.create("res/images/object/mortar-05.png");
    절구2.setPosition(width / 2, 700);
    절구2.setScale(0.4, 0.4);

    hammerImage = loadImage("res/images/character/hamor_hand.png");
    //translate(width / 2, height / 2); // 원하는 위치로 이동 (예: 화면 중심)
    //translate(imgWidth / 2, imgHeight / 2); // 우하단 기준으로 이동
    drawManager.addDrawable(hpBar);


    leftArrow = objectFactory.create("res/images/UI/Arrow_L.png");
    leftArrow.setPosition(970, 550);
    leftArrow.setScale(0.8, 0.8);

    rightArrow = objectFactory.create("res/images/UI/Arrow_R.png");
    rightArrow.setPosition(1180, 550);
    rightArrow.setScale(0.8, 0.8);

    arrowDescButton = new Button2(loadImage("res/images/UI/subtitle_bar_2.png"), 1065, 670);
    arrowDescButton.setScale(0.4, 0.4);
    arrowDescButton.textOffset = new PVector(-20, 0);
    arrowDescButton.text = "Press Left or Right Arrow Key";


    // TODO: 뭔가 다른식으로 재생해야 할듯??
    soundManager.playOnce("res/sound/effect/104_미니게임효과음.mp3");
  }
 
  public void draw() {
    pushStyle();
    checkKey();

    drawManager.drawing();

    if (절구Flag) {
      절구1.draw();
    }
    else {
      절구2.draw();
    }

    drawHammer();

    leftArrow.draw();
    rightArrow.draw();
    arrowDescButton.draw();

    uiManager.drawing();
    
    popStyle();
  }

  void checkKey() {
    if (keyPressed == false)
      return;
      
    boolean left = keyCode == 37;
    boolean right = keyCode == 39;
    
    if (left && right) {
      return;
    }
    
    float previousAngle = hammerZAngle;
    if (left) {
      hammerZAngle = max(hammerZAngle - 10, 0);
    }
    
    if (right) {
      hammerZAngle = min(hammerZAngle + 5, hammerMaxAngle);
    }

    println(hammerZAngle);
    if (hammerZAngle == 0 && previousAngle != 0) {
      절구Flag = !절구Flag;
      hpBar.hp += 1;

      if (hpBar.hp == 10) {
        loadNextScene();
      }
    }
  }
  
  void drawHammer() {
    pushMatrix();
  
    // 우하단을 회전 축으로 이동
    translate(500 + hammerImage.width, 50 + hammerImage.height - 75);
    rotate(radians(hammerZAngle));
    
    // 회전 축을 기준으로 이미지를 그리기 위해 원점에서 이동
    image(hammerImage, -hammerImage.width, -hammerImage.height);
    
    popMatrix();
  }
}