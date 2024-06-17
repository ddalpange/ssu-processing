public class Ground extends Drawable {
    color c;

    public Ground(int zIndex, color c) {
      super(0, height / 3 * 2, width, height / 3, zIndex);
      this.c = c;
    }

    public Ground(int x, int y, int w, int h, int zIndex, color c) {
        super(x, y, w, h, zIndex);
        this.c = c;
    }

    @Override
    public void draw() {
      pushStyle();

      noStroke();
      fill(this.c);
      rect(this.x, this.y, this.w, this.h);
      
      popStyle();
    }

    @Override
    public void onClick() {}
}
