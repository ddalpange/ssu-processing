import p5 from "p5";

export class FontManager {
  private font!: p5.Font;
  private defaultColor: string = "#000000";

  constructor() {}

  public setup() {
    this.font = p.loadFont("res/Font/NanumBarunGothic.otf");
    //this.font = loadFont("res/Font/NanumBarunGothic.otf");
  }

  public drawText2(text: string, x: number, y: number, size: number) {
    p.push();
    p.fill(this.defaultColor);
    p.textFont(this.font, size);
    p.text(text, x, y);
    p.pop();
  }

  public drawText3(text: string, x: number, y: number, size: number, color: string) {
    p.push();
    p.fill(color);
    p.textFont(this.font, size);
    p.text(text, x, y);
    p.pop();
  }

  public drawText(
    text: string,
    x: number,
    y: number,
    width: number,
    height: number,
    size: number
  ) {
    p.push();
    p.fill(this.defaultColor);
    p.textFont(this.font, size);
    p.text(text, x, y, width, height);
    p.pop();
  }
}

export const fontManager = new FontManager();
