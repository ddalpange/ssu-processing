final Scenes scenes = new Scenes();

public class Scenes {
  // p5.js 컨버팅시 최대한 문제 발생을 억제하기 위해 Reflection등 java 만의 기능은 사용하지 않는다.
  // 그러므로, 아래와 같이 모든 Scene을 하드코딩한다.
  public int[] sceneNumbers = {
    101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114,

    201, 202, 203, 204, 205, 206, 207, 208, 209,
    210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220,
    221, 222,

    301, 302, 303, 304, 305, 306, 307, 308, 309, 310,
    311, 312, 313, 314, 315, 316, 317, 318, 319, 320,
    321, 322, 323, 324, 325, 326, 327, 328, 329, 330
  };

  // TODO: 아직 임의 숫자
  public int[] introductionSceneNumbers = {
    101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114
  };

  // TODO: 아직 임의 숫자
  public int[] deploymentSceneNumbers = {
    201, 202, 203, 204, 205, 206, 207, 208, 209,
    210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220,
    221, 222
  };

  // TODO: 아직 임의 숫자
  public int[] endingSceneNumbers = {
    301, 302, 303, 304, 305, 306, 307, 308, 309, 310,
    311, 312, 313, 314, 315, 316, 317, 318, 319, 320,
    321, 322, 323, 324, 325, 326, 327, 328, 329, 330
  };

  public String[] getSceneNames() {
    String[] result = new String[sceneNumbers.length];
    for (int i = 0; i < sceneNumbers.length; i++) {
      result[i] = "Scene_" + sceneNumbers[i];
    }

    return result;
  }

  public BaseScene createScene(int sceneNumber) {
    boolean found = false;
    for (int n : sceneNumbers) {
      if (n == sceneNumber)
        found = true;
    }

    if (found == false) {
      throw new IllegalArgumentException("Invalid scene number: " + sceneNumber);
    }

    if (sceneNumber == 101)
      return new Scene_101();
    if (sceneNumber == 102)
      return new Scene_102();
    if (sceneNumber == 103)
      return new Scene_103();
    if (sceneNumber == 104)
      return new Scene_104();
    if (sceneNumber == 105)
      return new Scene_105();
    if (sceneNumber == 106)
      return new Scene_106();
    if (sceneNumber == 107)
      return new Scene_107();
    if (sceneNumber == 108)
      return new Scene_108();
    if (sceneNumber == 109)
      return new Scene_109();
    if (sceneNumber == 110)
      return new Scene_110();
    if (sceneNumber == 111)
      return new Scene_111();
    if (sceneNumber == 112)
      return new Scene_112();
    if (sceneNumber == 113)
      return new Scene_113();
    if (sceneNumber == 114)
      return new Scene_114();

    if (sceneNumber == 201)
      return new Scene_201();
    if (sceneNumber == 202)
      return new Scene_202();
    if (sceneNumber == 203)
      return new Scene_203();
    if (sceneNumber == 204)
      return new Scene_204();
    if (sceneNumber == 205)
      return new Scene_205();
    if (sceneNumber == 206)
      return new Scene_206();
    if (sceneNumber == 207)
      return new Scene_207();
    if (sceneNumber == 208)
      return new Scene_208();
    if (sceneNumber == 209)
      return new Scene_209();
    if (sceneNumber == 210)
      return new Scene_210();
    if (sceneNumber == 211)
      return new Scene_211();
    if (sceneNumber == 212)
      return new Scene_212();
    if (sceneNumber == 213)
      return new Scene_213();
    if (sceneNumber == 214)
      return new Scene_214();
    if (sceneNumber == 215)
      return new Scene_215();
    if (sceneNumber == 216)
      return new Scene_216();
    if (sceneNumber == 217)
      return new Scene_217();
    if (sceneNumber == 218)
      return new Scene_218();
    if (sceneNumber == 219)
      return new Scene_219();
    if (sceneNumber == 220)
      return new Scene_220();
    if (sceneNumber == 221)
      return new Scene_221();
    if (sceneNumber == 222)
      return new Scene_222();

    if (sceneNumber == 301)
      return new Scene_301();
    if (sceneNumber == 302)
      return new Scene_302();
    if (sceneNumber == 303)
      return new Scene_303();
    if (sceneNumber == 304)
      return new Scene_304();
    if (sceneNumber == 305)
      return new Scene_305();
    if (sceneNumber == 306)
      return new Scene_306();
    if (sceneNumber == 307)
      return new Scene_307();
    if (sceneNumber == 308)
      return new Scene_308();
    if (sceneNumber == 309)
      return new Scene_309();
    if (sceneNumber == 310)
      return new Scene_310();
    if (sceneNumber == 311)
      return new Scene_311();
    if (sceneNumber == 312)
      return new Scene_312();
    if (sceneNumber == 313)
      return new Scene_313();
    if (sceneNumber == 314)
      return new Scene_314();
    if (sceneNumber == 315)
      return new Scene_315();
    if (sceneNumber == 316)
      return new Scene_316();
    if (sceneNumber == 317)
      return new Scene_317();
    if (sceneNumber == 318)
      return new Scene_318();
    if (sceneNumber == 319)
      return new Scene_319();
    if (sceneNumber == 320)
      return new Scene_320();
    if (sceneNumber == 321)
      return new Scene_321();
    if (sceneNumber == 322)
      return new Scene_322();
    if (sceneNumber == 323)
      return new Scene_323();
    if (sceneNumber == 324)
      return new Scene_324();
    if (sceneNumber == 325)
      return new Scene_325();
    if (sceneNumber == 326)
      return new Scene_326();
    if (sceneNumber == 327)
      return new Scene_327();
    if (sceneNumber == 328)
      return new Scene_328();
    if (sceneNumber == 329)
      return new Scene_329();
    if (sceneNumber == 330)
      return new Scene_330();

    throw new IllegalArgumentException("Not handled scene number : " + sceneNumber);
  }
}
