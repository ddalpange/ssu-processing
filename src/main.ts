import p5 from "p5";
import { createIntroScene } from "./constants/allScenes";
import { sceneManager } from "./interfaces/SceneManager";
import { Scene_Intro_New } from "./scenes/Scene_Intro_New";
import { fontManager } from "./interfaces/FontManager";
//import { Scene_Intro_New } from "./scenes/Scene_Intro_New";
// import { imagePaths } from "./constants/imagePaths";

export const main = (p: p5) => {
    p.AUDIO;
    p.preload = function preload() {
        // Object.values(imagePaths).map((v) => p.loadImage(v));
    };
    p.setup = function setup() {
        window.locale = "en";
        p.createCanvas(1280, 720);
        fontManager.setup();
        //sceneManager.loadScene(allScenes[101]());
        sceneManager.loadScene(createIntroScene());
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
        scene?.mousePressed();
    };
    p.mouseReleased = function mouseReleased() {
        const scene = sceneManager.getCurrentScene();
        if (sceneManager?.getNextScene()) {
            scene?.mouseReleased();
        }
    };
    p.keyPressed = function keyPressed() {
        console.log("pressed key : " + p.key);
        if (p.key === "Backspace") {
            sceneManager.loadScene(new Scene_Intro_New());
        }
        if (p.key === "-") {
            sceneManager.getCurrentScene()?.loadPreviousScene();
            return;
        }
        if (p.key === "=") {
            sceneManager.getCurrentScene()?.loadNextScene();
            return;
        }

        const scene = sceneManager.getCurrentScene();
        scene?.keyPressed();
    };
};
