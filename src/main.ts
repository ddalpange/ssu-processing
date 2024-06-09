import p5 from "p5";
import { sceneManager } from "./interfaces/SceneManager";
import { Scene_101 } from "./scenes/Scene_101";

export const main = (p: p5) => {
  p.AUDIO;
  p.setup = function setup() {
    p.createCanvas(1280, 720);
    sceneManager.loadScene(new Scene_101());
  };
  p.draw = function draw() {
    updateDeltaTime();
    p.background(255);
    sceneManager.draw();
    window.mouseClickedThisFrame = false;
  };
  p.mousePressed = function mousePressed() {
    window.mouseClickedThisFrame = true;
    const scene = sceneManager.getCurrentScene();
    if (sceneManager?.getNextScene()) {
      scene?.mousePressed();
    }
  };
  p.mouseReleased = function mouseReleased() {
    window.mouseClickedThisFrame = true;
    const scene = sceneManager.getCurrentScene();
    if (sceneManager?.getNextScene()) {
      scene?.mouseReleased();
    }
  };
  p.keyPressed = function keyPressed() {
    window.mouseClickedThisFrame = true;
    const scene = sceneManager.getCurrentScene();
    scene?.keyPressed();
  };
};
