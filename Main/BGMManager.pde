public final BGMManager bgmManager = new BGMManager();

public class BGMSequence {
  public BGMSequence(String[] scenes, String bgmPath) {
    this.scenes = scenes;
    this.bgmPath = bgmPath;
  }

  public String[] scenes;
  public String bgmPath;

  public void play() {
    if (new File(sketchPath(bgmPath)).exists() == false) {
      println("BGM file not found: " + bgmPath);
      return;
    }

    bgm = new SoundFile(Main.this, bgmPath);
    // 볼륨 설정 50%
    bgm.loop();
    bgm.amp(0.2);
  }

  public void stop() {
    if (bgm != null)
      bgm.stop();
    bgm = null;
  }

  public SoundFile bgm;
}

public class BGMManager {
  ArrayList<BGMSequence> sequences = new ArrayList<BGMSequence>();

  private BGMSequence currentSequence = null;

  public BGMManager() {
    sequences.add(new BGMSequence(new String[]{ "Scene_Intro_New" }, "res/sound/bgm/오프닝.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_101", "Scene_102", "Scene_103" }, "res/sound/bgm/튜토리얼.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_104" }, "res/sound/bgm/미니게임용1.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_105" }, "res/sound/bgm/튜토리얼.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_106", "Scene_107", "Scene_108" }, "res/sound/bgm/저녁숲속게임.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_109" }, "res/sound/bgm/긴급한분위기_숏.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_110", "Scene_111", "Scene_112", "Scene_113", "Scene_114" }, "res/sound/bgm/배드엔딩.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_201" }, "res/sound/bgm/기본.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_202" }, "res/sound/bgm/긴급한분위기.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_203", "Scene_204", "Scene_205", "Scene_206", "Scene_207", "Scene_208", "Scene_209", "Scene_210", "Scene_211", "Scene_212" }, "res/sound/bgm/기본.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_213", "Scene_214", "Scene_215", "Scene_216" }, "res/sound/bgm/튜토리얼.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_217" }, "res/sound/bgm/추가엔딩.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_218", "Scene_219", "Scene_220" }, "res/sound/bgm/기본.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_221", "Scene_222", "Scene_301", "Scene_302" }, "res/sound/bgm/긴장되는분위기.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_303" }, "res/sound/bgm/미니게임용3.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_304", "Scene_305", "Scene_306", "Scene_307" }, "res/sound/bgm/긴급한분위기.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_308" }, "res/sound/bgm/미니게임용2.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_309", "Scene_310", "Scene_311" }, "res/sound/bgm/저녁숲속게임.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_312" }, "res/sound/bgm/기본.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_313" }, "res/sound/bgm/미니게임용2.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_314", "Scene_315", "Scene_316", "Scene_317" }, "res/sound/bgm/긴급한분위기.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_318" }, "res/sound/bgm/배드엔딩.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_319", "Scene_320", "Scene_321", "Scene_322" }, "res/sound/bgm/기본.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_323", "Scene_324", "Scene_325", "Scene_326", "Scene_327" }, "res/sound/bgm/긴장되는분위기.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_328", "Scene_329", "Scene_330" }, "res/sound/bgm/엔딩.mp3"));
    sequences.add(new BGMSequence(new String[]{ "Scene_Ending" }, "res/sound/bgm/엔딩크레딧.mp3"));
  }

  public void onSceneLoaded(BaseScene newScene) {
    println("onSceneLoaded: " + newScene.getClass().getSimpleName());
    String sceneName = newScene.getClass().getSimpleName();
    BGMSequence targetSequence = null;
    for (var sequence : sequences) {
      for (var sceneInSequence : sequence.scenes) {
        if (sceneInSequence.equals(sceneName)) {
          targetSequence = sequence;
          break;
        }
      }
    }

    if (targetSequence == currentSequence) {
      // Nothing to do. Keep playing.
      //println("Nothing to do. Keep playing.");
      return;
    }

    if (currentSequence != null) {
      currentSequence.stop();
    }

    currentSequence = targetSequence;
    if (currentSequence != null) {
      println("Playing BGM for " + sceneName);
      currentSequence.play();
    }
  }
}