public enum CharacterType {
  tiger("tiger"),
  boy("boy"),
  girl("girl"),
  mom("mom"),
  tiger_mom("tiger_mom");

  public final String name;

  private CharacterType(String name) {
    this.name = name;
  }
}

public enum CharacterPoseType {
  front("f"),
  left("left"),
  left_half("left_half"),
  climb("climb"),
  climb_rope("climb_rope"),
  black("black"),
  fall("fall"),
  fall_purple("fall_purple"),
  point("point"),
  pray("pray"),
  seat("seat"),
  smile("smile"),
  front_ricecake("front_ricecake"),
  back_ricecake("back_ricecake"),
  hand("hand"),
  back("b"),
  lay("lay"),

  // tiger only
  hungry("hungry"),
  knock("knock"),
  lay_01("lay_01"),
  lay_02("lay_02"),
  lay_03("lay_03"),
  angry("angry"),
  big("big"),
  mouth("mouth"),
  ricecake_01("ricecake_01"),
  ricecake_02("ricecake_02"),
  ricecake_03_01("ricecake_03_01"),
  ricecake_03_02("ricecake_03_02"),
  scream("scream"),
  thirsty("thirsty"),
  threat("threat"),
  well("well"),
  well_1("well_1"),
  well_2_1("well_2_1"),
  well_2_2("well_2_2");


  
  public final String name;

  private CharacterPoseType(String name) {
    this.name = name;
  }
}

final ObjectFactory objectFactory = new ObjectFactory();

public class ObjectFactory {
  public ShapeObject create(CharacterType type, CharacterPoseType pose) {
    String path = getShapePath(type, pose);

    if (path.endsWith(".svg"))
      return new ShapeObject(loadShape(path));
    else if (path.endsWith(".png"))
      return new ShapeObject(loadImage(path));

    throw new UnsupportedOperationException("Not implemented : " + path);
  }

  public SpriteAnimation createAnimation(CharacterType type, String pose, int count) {
    // type_pose_anim_1~count.png
    String path = "res/images/character/" + type.name + "_" + pose + "_anim_";
    ArrayList<PImage> images = new ArrayList<PImage>();
    for (int i = 1; i <= count; i++) {
      String fullPath = path + i + ".png";
      PImage image = loadImage(fullPath);
      if (image == null) {
        println("Failed to load image : " + fullPath);
        return null;
      }
      images.add(image);
    }

    return new SpriteAnimation(images.toArray(new PImage[0]));
  }

  public ShapeObject create(String path) {
    var image = loadImage(path);
    if (image == null) {
      println("Failed to load image : " + path);
      return null;
    }

    return new ShapeObject(image);
  }

  public String getShapePath(CharacterType type, CharacterPoseType pose) {
    if (!(type instanceof CharacterType) || !(pose instanceof CharacterPoseType))
      throw new UnsupportedOperationException("Not implemented : " + type + " " + pose);
    
    //boolean useSvg = false;
    //String prefix = "res/images/object/" + (useSvg ? "svg/" : "png/");
    String prefix = "res/images/character/";
    String extension = ".png";
    //String extension = useSvg ? ".svg" : ".png";
    
    return prefix + type.name + "_" + pose.name + extension;
  }
}

void loadBackground(String id, DrawManager drawManager) {
  String path = "res/images/bg/background_" + id + ".png";
  var obj = objectFactory.create(path);
  obj.setPosition(width / 2, height / 2);
  
  drawManager.addDrawable(obj);
}