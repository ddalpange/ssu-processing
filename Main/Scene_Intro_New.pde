public class Scene_Intro_New extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
  // 0: main, 1: sceneList
  private int mode = 0;

  // 0
  private Button startButton;
  private Button sceneListButton;
  private Button creditButton;
  private Button sceneButton4;


  // 1
  private Button[] sceneButtons;
  private Button backButton;
  private Button tableViewButton;
  private int listMoved = 0;
  private int sceneButtonWidth = 100;

  // 2
  private Button[] sceneButtonsTableView;


  public void setup() {
    startButton = new Button("시작", new PVector(600, 100), new PVector(200, 100));
    sceneListButton = new Button("바로가기", new PVector(600, 200), new PVector(200, 100));
    creditButton = new Button("만든 사람들", new PVector(600, 300), new PVector(200, 100));

    // 1
    var sceneNumbers = scenes.sceneNumbers;
    var sceneNumberStrs = new String[sceneNumbers.length];
    for (int i = 0; i < sceneNumbers.length; ++i) {
      sceneNumberStrs[i] = Integer.toString(sceneNumbers[i]);
    }
    var sceneButtonsWidth = sceneButtonWidth * sceneNumbers.length;
    sceneButtons = createGridButtons(sceneNumberStrs, 20, sceneNumbers.length, 200, 200, sceneButtonsWidth, 50);
    listMoved = scenes.sceneNumbers.length - 8;
    backButton = new Button("돌아가기", new PVector(800, 500), new PVector(200, 100));
    tableViewButton = new Button("전체보기", new PVector(800, 600), new PVector(200, 100));

    // 2
    sceneButtonsTableView = createGridButtons(sceneNumberStrs, 20, 3, 0, 0, 500, height);

  }
 
  public void draw() {
    //println("intronew draw");
    pushStyle();
    if (mode == 0) { // Main
      
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
      if (keyPressed) {
        boolean left = keyCode == 37;
        boolean right = keyCode == 39;
        if (left && listMoved < scenes.sceneNumbers.length - 8) {
          for (Button button : sceneButtons) {
            button.position.x += sceneButtonWidth;
          }
          ++listMoved;
        }
        if (right && listMoved > 0) {
          for (Button button : sceneButtons) {
            button.position.x -= sceneButtonWidth;
          }
          --listMoved;
        }
      }

      for (int i = 0; i < sceneButtons.length; i++) {
        if (sceneButtons[i].drawAndCheckClick()) {
          sceneManager.loadScene(scenes.createScene(scenes.sceneNumbers[i]));
        }
      }
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
