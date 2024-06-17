public class Scene_Intro_New extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  // 0: main, 1: sceneList
  private int mode = 0;

  // 0
  private ShapeObject title;
  private Button2 startButton;
  private Button2 sceneListButton;
  private Button2 creditButton;
  private Button2 localeButton;


  // 1
  private ShapeObject 도입버튼;
  private ShapeObject 전개버튼;
  private ShapeObject 결말버튼;
  private color textColor =  #7c633e;

  private Button2 backButton;
  private int sceneButtonWidth = 100;

  private Button[] introductionSceneButtons;
  private Button[] deploymentSceneButtons;
  private Button[] endingSceneButtons;

  public void setup() {

    //Scene_103_Setup(drawManager);
    loadBackground("intro", drawManager);

    // 0
    title = objectFactory.create("res/images/ui/Opening_TItle.png");
    title.setPosition(width / 2, 150);
    title.setScale(0.7, 0.7);
    //drawManager.addDrawable(title);

    PVector textOffset = new PVector(0, -5);
    startButton = new Button2(loadImage("res/images/ui/intro_button1.png"), "Start", 30, width / 2, 400);
    startButton.mouseOverImage = loadImage("res/images/ui/intro_button2.png");
    startButton.textOffset = textOffset;
    startButton.fontColor = textColor;

    sceneListButton = new Button2(loadImage("res/images/ui/intro_button1.png"), "Shortcuts", 30, width / 2, 500);
    sceneListButton.mouseOverImage = loadImage("res/images/ui/intro_button2.png");
    sceneListButton.textOffset = textOffset;
    sceneListButton.fontColor = textColor;

    creditButton = new Button2(loadImage("res/images/ui/intro_button1.png"), "Credits", 30, width / 2, 600);
    creditButton.mouseOverImage = loadImage("res/images/ui/intro_button2.png");
    creditButton.textOffset = textOffset;
    creditButton.fontColor = textColor;

    localeButton = new Button2(loadImage("res/images/ui/koreng.png"), locale, 20, width - 150, 200);
    localeButton.setScale(0.6, 0.6);
    localeButton.textOffset = new PVector(0, -2);
    localeButton.fontColor = textColor;

    refreshButtonText();
    
    // 1
    도입버튼 = objectFactory.create("res/images/ui/Opening_UI_03_01.png");
    도입버튼.setPosition(width / 3 - 200, 100);
    //도입버튼.setScale(0.7, 0.7);
    //drawManager.addDrawable(도입버튼);
  

    전개버튼 = objectFactory.create("res/images/ui/Opening_UI_03_02.png");
    전개버튼.setPosition(width / 2, 100);
    //전개버튼.setScale(0.7, 0.7);
    //drawManager.addDrawable(전개버튼);

    결말버튼 = objectFactory.create("res/images/ui/Opening_UI_03_03.png");
    결말버튼.setPosition(width / 3 * 2 + 200, 100);
    //결말버튼.setScale(0.7, 0.7);
    //drawManager.addDrawable(결말버튼);

    backButton = new Button2(loadImage("res/images/ui/button_back.png"), 50, 50);

    var sceneNumbers = scenes.sceneNumbers;
    var sceneNumberStrs = Util.ToStringArray(sceneNumbers);
    var sceneButtonsWidth = sceneButtonWidth * sceneNumbers.length;
    //var transparentColor = color(#000000, 0);
    var transparentColor = 0x00ffffff;

    introductionSceneButtons = createGridButtons(Util.ToStringArray(scenes.introductionSceneNumbers), 20, 1, width / 3 - 300,     150, 200, height - 170, transparentColor);
    deploymentSceneButtons = createGridButtons(Util.ToStringArray(scenes.deploymentSceneNumbers),     20, 1, width / 2 - 100,     150, 200, height - 170, transparentColor);
    endingSceneButtons = createGridButtons(Util.ToStringArray(scenes.endingSceneNumbers),             20, 1, width / 3 * 2 + 100,  150, 200, height - 170, transparentColor);
  }

  boolean drawButtonAndGetClicked(Button2 button) {
    button.draw();
    //button.update();
    return button.isClicked();
  }
 
  public void draw() {
    //println("intronew draw");
    pushStyle();
    drawManager.drawing();
    if (mode == 0) { // Main
      title.draw();

      if (drawButtonAndGetClicked(startButton)) {
        sceneManager.loadScene(new Scene_101());
      }

      if (drawButtonAndGetClicked(sceneListButton)) {
        mode = 1;
      }
      
      if (drawButtonAndGetClicked(creditButton)) {
        sceneManager.loadScene(new Scene_Ending());
      }

      if (drawButtonAndGetClicked(localeButton)) {
        locale = locale == "en" ? "ko" : "en";
        refreshButtonText();
      }

    }
    else if (mode == 1) { // Scene List
      도입버튼.draw();
      전개버튼.draw();
      결말버튼.draw();

      if (drawButtonAndGetClicked(backButton)) {
        mode = 0;
      }

      for (int i = 0; i < introductionSceneButtons.length; i++) {
        if (introductionSceneButtons[i].drawAndCheckClick()) {
          sceneManager.loadScene(scenes.createScene(scenes.introductionSceneNumbers[i]));
        }
      }

      for (int i = 0; i < deploymentSceneButtons.length; i++) {
        if (deploymentSceneButtons[i].drawAndCheckClick()) {
          sceneManager.loadScene(scenes.createScene(scenes.deploymentSceneNumbers[i]));
        }
      }

      for (int i = 0; i < endingSceneButtons.length; i++) {
        if (endingSceneButtons[i].drawAndCheckClick()) {
          sceneManager.loadScene(scenes.createScene(scenes.endingSceneNumbers[i]));
        }
      }

      if (drawButtonAndGetClicked(backButton)) {
        mode = 0;
      }
    }

    popStyle();
  }

  private void refreshButtonText() {
    localeButton.text = locale == "en" ? "English" : "한국어";
    if (locale == "en") {
      startButton.text = "Start";
      sceneListButton.text = "Shortcuts";
      creditButton.text = "Credits";
    } else {
      startButton.text = "시작";
      sceneListButton.text = "바로가기";
      creditButton.text = "제작진";
    }
  }
  
  public void mousePressed() {
    drawManager.mousePressed();
  }
}
