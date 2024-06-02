final SceneManager sceneManager = new SceneManager();

public class SceneManager {

  public SceneManager() {
  }

  public BaseScene getCurrentScene() { return currentScene; }
  public BaseScene getNextScene() { return nextScene; }
  
  private BaseScene currentScene;
  private BaseScene nextScene;
  
  private boolean fadeIn = false;
  private boolean fadeOut = false;
  private float alpha; // 0 ~ 255
  private float fadeSpeed = 350f; // fade seconds : 255 / fadeSpeed


  private boolean smoothFrame = false;

  public void Draw() {
    if (currentScene != null) {
        currentScene.draw();
    }

    float smoothDt = deltaTime;
    if (smoothFrame) {
      smoothDt = 0.01f;
      smoothFrame = false;
    }


    // ---> Black
    if (fadeOut == true && fadeIn == false) {
      alpha += smoothDt * fadeSpeed;

      if (alpha >= 255f) {
        fadeIn = true;
        alpha = 255f;
        fadeOut = false;
        if (nextScene != null) {
          currentScene = nextScene;
        }

        stopPlayingVoice();
        currentScene.setup();
        smoothFrame = true;
      }
    }

    // ---> Transparent
    if (fadeIn == true && fadeOut == false) {
      if (alpha > 0f) {
        alpha -= smoothDt * fadeSpeed;
      } else {
        alpha = 0f;
        fadeIn = false;
        nextScene = null;
      }
    }
    
    pushStyle();
    fill(0, alpha);
    rect(0, 0, width, height);
    popStyle();
  }

  public void loadScene(BaseScene scene) {
    loadScene(scene, true);
  }

  public void loadScene(BaseScene scene, boolean doFade) {
    if (nextScene != null)
        return;

    if (currentScene == null || doFade == false) {
        currentScene = scene;
        fadeIn = false;
        fadeOut = false;
        currentScene.setup();
        nextScene = null;
        stopPlayingVoice();
        return;
    }

    alpha = 0f;
    fadeIn = false;
    fadeOut = true;
    nextScene = scene;
    println("Next scene: " + nextScene.getClass().getName());
  }
}