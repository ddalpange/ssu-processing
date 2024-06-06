import p5 from "p5";

export const main = (p: p5) => {
  p.AUDIO;
  let image: any;
  p.setup = function setup() {
    p.createCanvas(1280, 720);
    image = p.loadImage("res/images/ui/button_1.png");
  };
  p.draw = function draw() {
    p.background(0);
    p.image(image, 0, 0);
  };
  p.mousePressed = function mousePressed() {};
  p.mouseReleased = function mouseReleased() {};
  p.keyPressed = function keyPressed() {};
};
