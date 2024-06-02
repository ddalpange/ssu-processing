public abstract class BaseScene {
  public DrawManager drawManager = new DrawManager();
  public AnimationManager animationManager = new AnimationManager();
  public EffectManager effectManager = new EffectManager();
  public UiManager uiManager = new UiManager();

  public void startAnimation(BaseAnimation animation) {
    animationManager.startAnimation(animation);
  }

    public void stopAnimation(BaseAnimation animation) {
    animationManager.stopAnimation(animation);
  }

  public void clearAnimation()
  {
    animationManager.clearAnimation();
  }
  
  // 씬이 최초로 생성되는 시점에 1회 호출됨.
  public abstract void setup();
  
  public abstract void draw();

  public abstract int getNextScene();
  public void loadNextScene() {
    loadNextScene(true);
  }
  public void loadNextScene(boolean doFade) {
    int sceneNumber = getNextScene();
    if (sceneNumber != -1) {
      sceneManager.loadScene(scenes.createScene(sceneNumber), doFade);
    } else {
      println("다음 씬이 없거나 매핑이 안되어있습니다.");
    }
  }
  public abstract int getPreviousScene();
  public void loadPreviousScene() {
    int sceneNumber = getPreviousScene();
    if (sceneNumber != -1) {
      sceneManager.loadScene(scenes.createScene(sceneNumber));
    } else {
      println("이전 씬이 없거나 매핑이 안되어있습니다.");
    }
  }
  
  public void mousePressed() {
    println("BaseScene: mousePressed");
  }

  public void mouseReleased() {
    println("BaseScene: mouseReleased");
  }

  public void keyPressed() {
    println("BaseScene: mousePressed");
  }
}
