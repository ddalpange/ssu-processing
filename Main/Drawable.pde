public class Drawable {
  protected float x;
  protected float y;
  protected float initialW;
  protected float initialH;
  protected float w;
  protected float h;
  protected float zAngle;
  protected int zIndex;
  protected PVector startPos;
  protected PVector endPos;
  protected PVector center;
  protected PVector scale;
  protected boolean isMouseOver;
  
  public Drawable() {
    this.setup(0, 0, 0, 0, 0);
  }

  public Drawable(float x, float y, float w, float h) {
    this.setup(x, y, w, h, 0);
  }

  public Drawable(float x, float y, float w, float h, int zIndex) {
    this.setup(x, y, w, h, zIndex);
  }
  
  public void setup(float x, float y, float w, float h, int zIndex){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.initialW = w;
    this.initialH = h;
    this.zAngle = 0;
    this.zIndex = zIndex;
    this.isMouseOver = false;

    this.startPos = new PVector(x, y);
    this.endPos = new PVector(x + w, y + h);
    this.center = new PVector(x + w/2, y + h/2);
    if (scale == null) {
      this.scale = new PVector(1, 1);
    }
  }

  public float getX() { return x; }
  public float getY() { return y; }

  public void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public float getScaleX() { return scale.x; }
  public float getScaleY() { return scale.y; }

  public void setScale(float x, float y) {
    this.scale.x = x;
    this.scale.y = y;
    this.w = this.initialW * abs(x);
    this.h = this.initialH * abs(y);
  }

  // rotate 기본 함수랑 겹쳐서 이름 바꿈..
  public void d_rotate(float zAngle) {
    this.zAngle = zAngle;
  }

  public void setZIndex(int zIndex) {
    this.zIndex = zIndex;
  }

  // draw function
  public void draw(){
  }

  public void onClick(){
  }

  public boolean mousePressed(){
    var modX = this.x - this.w / 2;
    var modY = this.y - this.h / 2;
    if(
      mouseX > modX 
      && mouseX < modX + this.w
      && mouseY > modY 
      && mouseY < modY + this.h
    ){
      this.onClick();
      return true;
    } 
    return false;
  }

  public boolean isMouseOver() {
    var modX = this.x - this.w / 2;
    var modY = this.y - this.h / 2;
    if(
      mouseX > modX 
      && mouseX < modX + this.w
      && mouseY > modY 
      && mouseY < modY + this.h
    ){
      return true;
    } 
    return false;
  }

  public void update() {
    if (isMouseOver()) {
      if (!this.isMouseOver) {
        setScale(getScaleX() * 1.2, getScaleY() * 1.2);
        this.isMouseOver = true;
      }
    } else {
      if (this.isMouseOver) {
        setScale(getScaleX() / 1.2, getScaleY() / 1.2);
        this.isMouseOver = false;
      }
    }
  }
}
