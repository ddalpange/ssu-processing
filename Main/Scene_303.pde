public class Scene_303 extends BaseScene {
  @Override
  public int getPreviousScene() { return 302; }

  @Override
  public int getNextScene() { return 304; }

  int GOAL_IN_HEIGHT = -168;
  int GO_UP_SPEED = 8;

  int START_COUNTDOWN_TIME = 3000; // 3초
  int GAME_COUNTDOWN_TIME = 20000; // 20초

  int boyAndGirlHeight = height;

  int startTimeLeft = START_COUNTDOWN_TIME / 1000;
  int gameTimeLeft = GAME_COUNTDOWN_TIME / 1000;
  int startTime;

  boolean isGameStart = false;
  boolean isDialogVisible;

  ShapeObject boy;
  ShapeObject girl;

  Button skipButton;
  Button retryButton;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    isDialogVisible = uiManager.dialogUi.next();

    loadBackground("40", drawManager);

    boy = createCharacter(CharacterType.boy, width / 2 - 120);
    girl = createCharacter(CharacterType.girl, width / 2 + 90);

    retryButton = createButton("retry?", width / 2 - 150, height / 2 - 150);
    skipButton = createButton("skip?", width / 2 - 150, height / 2 + 50);
  }
 
  private ShapeObject createCharacter(CharacterType type, int xPosition) {
    ShapeObject character = objectFactory.create(type, CharacterPoseType.climb);
    character.setPosition(xPosition, boyAndGirlHeight);
    character.setScale(0.4, 0.4);
    drawManager.addDrawable(character);

    return character;
  }

  private Button createButton(String text, int x, int y) {
    Button button = new Button();
    button.text = text;
    button.position = new PVector(x, y);
    button.size = new PVector(300, 100);

    return button;
  }

  public void draw() {
    pushStyle();
    smooth();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    drawingCountdown();
    drawingGameOver();

    popStyle();
  }

  private void initGame() {
    boyAndGirlHeight = height;
    boy.setPosition(width / 2 - 120 , boyAndGirlHeight);
    girl.setPosition(width / 2 + 90, boyAndGirlHeight);
    startTimeLeft = START_COUNTDOWN_TIME / 1000;
    gameTimeLeft = GAME_COUNTDOWN_TIME / 1000;

    isGameStart = false;
  }

  private void drawingGameOver() {
    if (isGameOver()) {
      if (retryButton.drawAndCheckClick()) {
        initGame();
      }
      if (skipButton.drawAndCheckClick()) {
        loadNextScene();
      }
     }
  }

  private void drawingCountdown() {
    if (!isDialogVisible && !isGameOver()) {
      startTimeLeft = setCountdown(START_COUNTDOWN_TIME);
      
      if (!isGameStart && startTimeLeft > 0) {
        fontManager.drawText(
          str(startTimeLeft), 
          width / 2 - 50,
          height / 2 - 50, 
          width / 2 + 50, 
          height / 2 + 50, 
          100
        );
      } else if (!isGameStart) {
        startTime = millis();
        isGameStart = true;
      }

      if (isGameStart) {
        gameTimeLeft = setCountdown(GAME_COUNTDOWN_TIME);
      }
      textAlign(RIGHT);
      fontManager.drawText(str(gameTimeLeft), width - 90, 10, 80, 60, 50);
    }
  }

  private boolean isGameOver() {
    if (isGameStart && gameTimeLeft <= 0) {
      return true;
    }

    return false;
  }

  private int setCountdown(int countdownTime) {
      int timeElapsed = millis() - startTime;
      int timeLeft = (countdownTime - timeElapsed) / 1000;

      return timeLeft + 1;
  }

  private void setGoUp() {
    boyAndGirlHeight -= GO_UP_SPEED;

    boy.setPosition(width / 2 - 120 , boyAndGirlHeight);
    girl.setPosition(width / 2 + 90, boyAndGirlHeight);

    if (boyAndGirlHeight == GOAL_IN_HEIGHT) {
      loadNextScene();
    }
  }
  
  public void mousePressed() {
    isDialogVisible = uiManager.dialogUi.next();

    if (!isDialogVisible) {
      uiManager.dialogUi.hide();
      startTime = millis();
    }
  }
  
  public void keyPressed() {
    int spacebar = 32;
    if (isGameStart && !isGameOver() && keyCode == spacebar) {   
      soundManager.playOnce("res/sound/effect/303.308_미니게임클릭소리.mp3");
      setGoUp();
    }
  }
}
