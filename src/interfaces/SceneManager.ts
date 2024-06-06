import { BaseScene } from "./BaseScene";
import { Util } from "./Util";

export class SceneManager {
  private currentScene: BaseScene | null;
  private nextScene: BaseScene | null;
  private fadeIn: boolean = false;
  private fadeOut: boolean = false;
  private alpha: number = 0; // 0 ~ 255
  private fadeSpeed: number = 350; // fade seconds : 255 / fadeSpeed
  private smoothFrame: boolean = false;

  constructor() {
    this.currentScene = null;
    this.nextScene = null;
  }

  getCurrentScene(): BaseScene | null {
    return this.currentScene;
  }

  getNextScene(): BaseScene | null {
    return this.nextScene;
  }

  draw() {
    if (this.currentScene !== null) {
      this.currentScene.draw();

      // test: Scene number text
      p.push();
      p.fill(0);
      const sceneNumber = Util.GetSceneNumber(this.currentScene);
      if (sceneNumber !== -1) {
        p.text(sceneNumber.toString(), p.width - 50, 20, 25);
      }
      p.pop();
    }

    let smoothDt = deltaTime;
    if (this.smoothFrame) {
      smoothDt = 0.01;
      this.smoothFrame = false;
    }

    // ---> Black
    if (this.fadeOut && !this.fadeIn) {
      this.alpha += smoothDt * this.fadeSpeed;

      if (this.alpha >= 255) {
        this.fadeIn = true;
        this.alpha = 255;
        this.fadeOut = false;
        if (this.nextScene !== null) {
          this.currentScene = this.nextScene;
        }

        // stopPlayingVoice();
        this.currentScene?.setup();
        this.smoothFrame = true;
      }
    }

    // ---> Transparent
    if (this.fadeIn && !this.fadeOut) {
      if (this.alpha > 0) {
        this.alpha -= smoothDt * this.fadeSpeed;
      } else {
        this.alpha = 0;
        this.fadeIn = false;
        this.nextScene = null;
      }
    }

    p.push();
    p.fill(0, this.alpha);
    p.rect(0, 0, p.width, p.height);
    p.pop();
  }

  loadScene(scene: BaseScene, doFade?: boolean): void {
    if (this.nextScene !== null) {
      return;
    }

    if (this.currentScene === null || !doFade) {
      this.currentScene = scene;
      this.fadeIn = false;
      this.fadeOut = false;
      // stopPlayingVoice();
      this.currentScene.setup();
      this.nextScene = null;
      return;
    }

    this.alpha = 0;
    this.fadeIn = false;
    this.fadeOut = true;
    this.nextScene = scene;
    console.log("Next scene: " + this.nextScene.constructor.name);
  }
}

export const sceneManager = new SceneManager();
