public class Scene_Intro_New extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  // 0: main, 1: sceneList
  private int mode = 0;

  // 0
  private ShapeObject title;
  private Button startButton;
  private Button sceneListButton;
  private Button creditButton;
  private Button sceneButton4;


  // 1
  private ShapeObject 도입버튼;
  private ShapeObject 전개버튼;
  private ShapeObject 결말버튼;

  private Button[] sceneButtons;
  private Button backButton;
  private Button tableViewButton;
  private int listMoved = 0;
  private int sceneButtonWidth = 100;

  private Button[] introductionSceneButtons;
  private Button[] deploymentSceneButtons;
  private Button[] endingSceneButtons;

  // 2
  private Button[] sceneButtonsTableView;


  public void setup() {

    // 0
    title = objectFactory.create("res/images/UI/Opening_TItle.png");
    title.setPosition(width / 2, 100);
    title.setScale(0.7, 0.7);
    //drawManager.addDrawable(title);

    startButton = new Button(new PVector(width / 2, 400), null, loadImage("res/images/UI/Opening_UI_01_01.png"));
    sceneListButton = new Button(new PVector(width / 2, 500), null, loadImage("res/images/UI/Opening_UI_01_02.png"));
    creditButton = new Button(new PVector(width / 2, 600), null, loadImage("res/images/UI/Opening_UI_01_03.png"));

    
    // 1
    도입버튼 = objectFactory.create("res/images/UI/Opening_UI_03_01.png");
    도입버튼.setPosition(width / 3 - 200, 100);
    //도입버튼.setScale(0.7, 0.7);
    //drawManager.addDrawable(도입버튼);
  

    전개버튼 = objectFactory.create("res/images/UI/Opening_UI_03_02.png");
    전개버튼.setPosition(width / 2, 100);
    //전개버튼.setScale(0.7, 0.7);
    //drawManager.addDrawable(전개버튼);

    결말버튼 = objectFactory.create("res/images/UI/Opening_UI_03_03.png");
    결말버튼.setPosition(width / 3 * 2 + 200, 100);
    //결말버튼.setScale(0.7, 0.7);
    //drawManager.addDrawable(결말버튼);

    backButton = new Button(new PVector(30, 30), null, loadImage("res/images/UI/button_play.png"));

    var sceneNumbers = scenes.sceneNumbers;
    var sceneNumberStrs = Util.ToStringArray(sceneNumbers);
    var sceneButtonsWidth = sceneButtonWidth * sceneNumbers.length;
    sceneButtons = createGridButtons(sceneNumberStrs, 20, sceneNumbers.length, 200, 200, sceneButtonsWidth, 50);
    listMoved = scenes.sceneNumbers.length - 8;
    //backButton = new Button("돌아가기", new PVector(800, 500), new PVector(200, 100));
    tableViewButton = new Button("전체보기", new PVector(800, 600), new PVector(200, 100));

    introductionSceneButtons = createGridButtons(Util.ToStringArray(scenes.introductionSceneNumbers), 20, 1, width / 3 - 350,     200, 250, height - 250);
    deploymentSceneButtons = createGridButtons(Util.ToStringArray(scenes.deploymentSceneNumbers),     20, 1, width / 2 - 150,      200, 250, height - 250);
    endingSceneButtons = createGridButtons(Util.ToStringArray(scenes.endingSceneNumbers),             20, 1, width / 3 * 2 + 50, 200, 250, height - 250);

    // 2
    sceneButtonsTableView = createGridButtons(sceneNumberStrs, 20, 3, 0, 0, 500, height);

  }
 
  public void draw() {
    //println("intronew draw");
    pushStyle();
    if (mode == 0) { // Main
      title.draw();
      if (startButton.drawAndCheckClick()) {
        sceneManager.loadScene(new Scene_101());
      }
      if (sceneListButton.drawAndCheckClick()) {
        mode = 1;
      }
      
      if (creditButton.drawAndCheckClick()) {
        sceneManager.loadScene(new Scene_Ending());
      }

    }
    else if (mode == 1) { // Scene List
      도입버튼.draw();
      전개버튼.draw();
      결말버튼.draw();

      if (backButton.drawAndCheckClick()) {
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
      if (keyPressed) {

        
        // boolean left = keyCode == 37;
        // boolean right = keyCode == 39;
        // if (left && listMoved < scenes.sceneNumbers.length - 8) {
        //   for (Button button : sceneButtons) {
        //     button.position.x += sceneButtonWidth;
        //   }
        //   ++listMoved;
        // }
        // if (right && listMoved > 0) {
        //   for (Button button : sceneButtons) {
        //     button.position.x -= sceneButtonWidth;
        //   }
        //   --listMoved;
        // }
      }

      // for (int i = 0; i < sceneButtons.length; i++) {
      //   if (sceneButtons[i].drawAndCheckClick()) {
      //     sceneManager.loadScene(scenes.createScene(scenes.sceneNumbers[i]));
      //   }
      // }
      if (backButton.drawAndCheckClick()) {
        mode = 0;
      }
      if (tableViewButton.drawAndCheckClick()) {
        mode = 2;
      }
    }
    else if (mode == 2) { // Scene List - Table View
     for (int i = 0; i < sceneButtonsTableView.length; i++) {
        if (sceneButtonsTableView[i].drawAndCheckClick()) {
          sceneManager.loadScene(scenes.createScene(scenes.sceneNumbers[i]));
        }
      }

      if (backButton.drawAndCheckClick()) {
        mode = 0;
      }
      if (tableViewButton.drawAndCheckClick()) {
        mode = 1;
      }
    }

    popStyle();

    drawManager.drawing();
  }
  
  public void mousePressed() {
    drawManager.mousePressed();
  }
}
