public class Scene_303 extends BaseScene {
  @Override
  public int getPreviousScene() { return 302; }

  @Override
  public int getNextScene() { return 304; }

  int GOAL_IN_HEIGHT = -232;
  int GO_UP_SPEED = 8;

  int START_COUNTDOWN_TIME = 3000; // 3초
  int GAME_COUNTDOWN_TIME = 20000; // 20초

  int boyX =  width / 2 - 140;
  int girlX =  width / 2 + 110;

  int boyAndGirlHeight = height;

  int startTimeLeft = START_COUNTDOWN_TIME / 1000;
  int gameTimeLeft = GAME_COUNTDOWN_TIME / 1000;
  int startTime = 0;

  boolean isGameStart = false;
  boolean isDialogVisible;

  ShapeObject boy;
  ShapeObject girl;

  Button skipButton;
  Button retryButton;
  
  ShapeObject space;
  ScaleAnimation spaceUpAnimation;
  ScaleAnimation spaceDownAnimation;

  float spaceScale = 0.6f;
  float spaceScaleDuration = 0.4f;

  int curCount = 0;
  TimeTracker timeTracker = new TimeTracker();

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    isDialogVisible = uiManager.dialogUi.next();

    loadBackground("40", drawManager);

    boy = createCharacter(CharacterType.boy, boyX);
    girl = createCharacter(CharacterType.girl, girlX);

    retryButton = createButton(locale == "en" ? "retry?" : "다시 시도?", width / 2 - 150, height / 2 - 150);
    skipButton = createButton(locale == "en" ? "skip?" : "건너뛰기?", width / 2 - 150, height / 2 + 50);

    space = objectFactory.create("res/images/UI/space.png");
    space.setPosition(width - 200, height - 80);
    space.setScale(spaceScale, spaceScale);
    drawManager.addDrawable(space);
    
    spaceUpAnimation = new ScaleAnimation(space, spaceScale + spaceScale * 0.05, spaceScale + spaceScale * 0.05, spaceScaleDuration);
    spaceDownAnimation = new ScaleAnimation(space, spaceScale - spaceScale * 0.05, spaceScale - spaceScale * 0.05, spaceScaleDuration);
  }
 
  private ShapeObject createCharacter(CharacterType type, int xPosition) {
    ShapeObject character = objectFactory.create(type, CharacterPoseType.climb);
    character.setPosition(xPosition, boyAndGirlHeight);
    character.setScale(0.55, 0.55);
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

  private void updateScale() {
    if(timeTracker.IfTimeOver(curCount * spaceScaleDuration)) {
      clearAnimation();
      var isEven = curCount % 2 == 0;
      startAnimation(isEven ? spaceUpAnimation.reset() : spaceDownAnimation.reset());
      curCount++;
    }
  }

  public void draw() {
    pushStyle();
    smooth();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    timeTracker.update();
    animationManager.update();
    
    drawingCountdown();
    drawingGameOver();

    updateScale();

    popStyle();
  }

  private void initGame() {
    isGameStart = false;
    boyAndGirlHeight = height;
    boy.setPosition(boyX, boyAndGirlHeight);
    girl.setPosition(girlX, boyAndGirlHeight);
    startTimeLeft = START_COUNTDOWN_TIME / 1000;
    gameTimeLeft = GAME_COUNTDOWN_TIME / 1000;

    startTime = millis();
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
      } else if (!isGameStart && startTimeLeft == 0) {
        fontManager.drawText(
          locale == "en" ? "START!" : "시작!", 
          width / 2 - 200,
          height / 2 - 50, 
          width / 2 + 100, 
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
      fontManager.drawText(
        str(gameTimeLeft), 
        width / 2 - 130,
        30, 
        width / 2 + 100, 
        200,
        50
      );
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

    boy.setPosition(boyX , boyAndGirlHeight);
    girl.setPosition(girlX, boyAndGirlHeight);

    if (boyAndGirlHeight == GOAL_IN_HEIGHT) {
      loadNextScene();
    }
  }
  
  public void mousePressed() {
    isDialogVisible = uiManager.dialogUi.next();

    if (startTime == 0 && !isDialogVisible) {
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
