public static class Util
{
  public static boolean InRange(float target, float a, float b)
  {
    return b >= target && target >= a;
  }

  public static String[] ToStringArray(int[] intArr) {
    var result = new String[intArr.length];
    for (int i = 0; i < intArr.length; ++i) {
      result[i] = Integer.toString(intArr[i]);
    }

    return result;
  }

  public static boolean isNullOrEmpty(String s) {
    return s == null || s.length() == 0;
  }

  public static boolean isNullOrWhitespace(String s) {
    return s == null || isWhitespace(s);
  }
  public static boolean isWhitespace(String s) {
    int length = s.length();
    if (length > 0) {
      for (int i = 0; i < length; i++) {
        if (!Character.isWhitespace(s.charAt(i))) {
          return false;
        }
      }
    }

    return true;
  }

  public static int GetSceneNumber(BaseScene scene) {
    String className = scene.getClass().getSimpleName();
    if (className.startsWith("Scene_")) {
        try {
            String sceneNumberStr = className.substring(6);
            return Integer.parseInt(sceneNumberStr);
    } catch (NumberFormatException e) {
        return -1;
    }
    }
    return -1;
  }
}
