import p5 from "p5";
declare global {
  interface Window {
    p: p5;
    deltaTime: number;
    mouseClickedThisFrame: boolean;
    updateDeltaTime: () => void;
  }
  var p: p5;
  var deltaTime: number;
  var updateDeltaTime: () => void;
  var mouseClickedThisFrame: boolean;
}

declare const p: p5;
