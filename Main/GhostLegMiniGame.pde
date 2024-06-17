public class GhostLegGameManager {
  protected int legCount = 0;
  protected ArrayList<Integer> sceneNums = new ArrayList<Integer>();
  protected ArrayList<Drawable> drawables = new ArrayList<Drawable>();

  public GhostLegGameManager(int legCount, int[] scenes, Drawable[] drawables){
    if(legCount < 0){
      throw new IllegalArgumentException("Leg count must be greater than 0");
    } else if(scenes.length != legCount){
      throw new IllegalArgumentException("Leg count must match the number of scenes");
    } else if(drawables.length != legCount){
      throw new IllegalArgumentException("Leg count must match the number of drawables");
    }

    this.legCount = legCount;
    ArrayList<Integer> sceneList = new ArrayList<Integer>();
    for(int temp : scenes){
        sceneList.add(temp);
    }
    ArrayList<Drawable> dList = new ArrayList<Drawable>();
    for(Drawable temp : drawables){
        dList.add(temp);
    }

    this.sceneNums = sceneList;
    this.drawables = dList;
  }

  public void update(){
    for(int i = 0; i < this.drawables.size(); i++){
      Drawable d = this.drawables.get(i);
      int s = this.sceneNums.get(i);
      boolean isPressed = d.mousePressed();
      if(isPressed && s > 0){
        sceneManager.loadScene(scenes.createScene(s));
      }
    }
  }
}
