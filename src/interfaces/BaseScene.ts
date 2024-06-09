import { allScenes } from "../constants/allScenes";
import { AnimationManager } from "./AnimationManager";
import { BaseAnimation } from "./BaseAnimation";
import { DrawManager } from "./DrawManager";
import { EffectManager } from "./EffectManager";
import { sceneManager } from "./SceneManager";
import { UiManager } from "./UiManager";

export abstract class BaseScene {
  public abstract setup(): void;
  public abstract getNextScene(): number;
  public abstract getPreviousScene(): number;
  public abstract draw(): void;
  public mousePressed(): void {
    console.log("BaseScene: mousePressed");
  }
  public mouseReleased(): void {
    console.log("BaseScene: mouseReleased");
  }
  public keyPressed(): void {
    console.log("BaseScene: keyPressed");
  }

  public drawManager: DrawManager = new DrawManager();
  public animationManager: AnimationManager = new AnimationManager();
  public effectManager: EffectManager = new EffectManager();
  public uiManager: UiManager = new UiManager();

  public startAnimation(animation: BaseAnimation): void {
    this.animationManager.startAnimation(animation);
  }

  public stopAnimation(animation: BaseAnimation): void {
    this.animationManager.stopAnimation(animation);
  }

  public clearAnimation(): void {
    this.animationManager.clearAnimation();
  }

  public loadNextScene(doFade: boolean = true): void {
    const sceneNumber: number = this.getNextScene();
    if (sceneNumber !== -1) {
      sceneManager.loadScene(allScenes[sceneNumber](), doFade);
    } else {
      console.log("다음 씬이 없거나 매핑이 안되어있습니다.");
    }
  }

  public loadPreviousScene(): void {
    const sceneNumber: number = this.getPreviousScene();
    if (sceneNumber !== -1) {
      sceneManager.loadScene(allScenes[sceneNumber]());
    } else {
      console.log("이전 씬이 없거나 매핑이 안되어있습니다.");
    }
  }
}
