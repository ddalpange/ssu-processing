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
}
