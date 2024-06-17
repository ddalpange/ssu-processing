import processing.sound.*;

public enum SoundType {
  once("once"),
  loop("loop");
  
  public final String name;

  private SoundType(String name) {
    this.name = name;
  }
}

public enum SoundList {
    miniBGM("miniBGM", "miniBGM.mp3"),
    lightning("lightning", "lightning.mp3");
    
    public final String name;
    public final String fileName;
    
    private SoundList(String name, String fileName) {
        this.name = name;
        String prefix = "res/sound/";
        this.fileName = prefix + fileName;
    }
}

final SoundManager soundManager = new SoundManager();

public class SoundManager {
  public void setup() {
  }
 
  public void draw() {
  }
  
  public void playAudio(SoundType soundType, SoundList soundName) {
    SoundFile file = new SoundFile(Main.this, soundName.fileName);
    if(soundType == SoundType.loop){
        file.loop();
    } else if(soundType == SoundType.once){
        file.play();
    }
  }

  public SoundFile playOnce(String path) {
    if (new File(sketchPath(path)).exists() == false) {
      println("File not found: " + path);
      return null;
    }
    SoundFile file = new SoundFile(Main.this, path);
    if (file == null)
      return null;

    file.play();
    return file;
  }
}