public class Rock extends Drawable {
    public Rock(float x, float y, float w, float h, int zIndex) {
        super(x, y, w, h, zIndex);
    }

    @Override
    public void draw() {
        rect(this.x, this.y, this.w, this.h);
    }

    @Override
    public void onClick(){
        System.out.println("Clicked Rock " + this.zIndex);
    }
}
