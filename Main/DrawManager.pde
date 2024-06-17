public class DrawManager {
  public ArrayList<Drawable> drawables = new ArrayList<Drawable>();

  private DrawManager(){
    super();
  }

  public void addDrawable(Drawable drawable){
    drawables.add(drawable);
      // sort by drawable zIndex
    drawables.sort((o1, o2) -> o1.zIndex - o2.zIndex);
  }

  public boolean removeDrawable(Drawable drawable){
    return drawables.remove(drawable);
  }

  public void drawing (){
    for(Drawable drawable : drawables){
      drawable.draw();
    }
  }

  public void mousePressed(){
    // loop reverse
    for (Drawable drawable : drawables) {
      boolean clicked = drawable.mousePressed();
      System.out.println(clicked);
      if(clicked){
        break;
      }
    }
  }
}
