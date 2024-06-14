public class Scene_316 extends BaseScene {
  @Override
  public int getPreviousScene() { return 315; }

  @Override
  public int getNextScene() { return 317; }

private ShapeObject effect;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();

    loadBackground("53-1", drawManager);

    effect = objectFactory.create("res/images/object/fluff.png");
    effect.setPosition(width/2, height/2);
    effect.setScale(1f, 1f);

    soundManager.playOnce("res/sound/effect/316.326_밧줄툭끊어지는소리.mp3");
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    popStyle();
  }
  
  int clickCount = 0;
  public void mousePressed() {
    if (clickCount == 0) {
      loadBackground("53-2", drawManager);
      ++clickCount;
      uiManager.dialogUi.next();
      effect.drawImage();

      drawManager.addDrawable(effect);
      return;
    }

    if (clickCount == 1) {
      loadBackground("53-3", drawManager);
      ++clickCount;

      drawManager.removeDrawable(effect);
      effect.setScale(1.3f, 1.3f);
      drawManager.addDrawable(effect);
      return;
    }
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
