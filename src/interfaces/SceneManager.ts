import { BaseScene } from "./BaseScene";
import { Util } from "./Util";

export class SceneManager {
  private currentScene: BaseScene | null;
  private nextScene: BaseScene | null;

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
    // 현재 화면 그리기
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
  }

  loadScene(scene: BaseScene, doFade?: boolean): void {
    doFade;
    this.currentScene = scene;
    this.currentScene.setup();
    console.log("debug loadScene", { scene });
  }
}

export const sceneManager = new SceneManager();
