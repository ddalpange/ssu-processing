public final EaseMethod easeMethod = new EaseMethod();
public class EaseMethod {
  public float evaluate(EaseType easeType, float start, float end, float time) {
    switch (easeType) {
      case Linear:
        return start + (end - start) * Linear(time);
      case InQuad:
        return start + (end - start) * InQuad(time);
      case OutQuad:
        return start + (end - start) * OutQuad(time);
      case InOutQuad:
        return start + (end - start) * InOutQuad(time);
      case InCubic:
        return start + (end - start) * InCubic(time);
      case OutCubic:
        return start + (end - start) * OutCubic(time);
      case InOutCubic:
        return start + (end - start) * InOutCubic(time);
      case InQuart:
        return start + (end - start) * InQuart(time);
      case OutQuart:
        return start + (end - start) * OutQuart(time);
      case InOutQuart:
        return start + (end - start) * InOutQuart(time);
      case InQuint:
        return start + (end - start) * InQuint(time);
      case OutQuint:
        return start + (end - start) * OutQuint(time);
      case InOutQuint:
        return start + (end - start) * InOutQuint(time);
      case InSine:
        return start + (end - start) * InSine(time);
      case OutSine:
        return start + (end - start) * OutSine(time);
      case InOutSine:
        return start + (end - start) * InOutSine(time);
      case InExpo:
        return start + (end - start) * InExpo(time);
      case OutExpo:
        return start + (end - start) * OutExpo(time);
      case InOutExpo:
        return start + (end - start) * InOutExpo(time);
      case InCirc:
        return start + (end - start) * InCirc(time);
      case OutCirc:
        return start + (end - start) * OutCirc(time);
      case InOutCirc:
        return start + (end - start) * InOutCirc(time);
      case InElastic:
        return start + (end - start) * InElastic(time);
      case OutElastic:
        return start + (end - start) * OutElastic(time);
      case InOutElastic:
        return start + (end - start) * InOutElastic(time);
      case InBack:
        return start + (end - start) * InBack(time);
      case OutBack:
        return start + (end - start) * OutBack(time);
      case InOutBack:
        return start + (end - start) * InOutBack(time);
      case InBounce:
        return start + (end - start) * InBounce(time);
      case OutBounce:
        return start + (end - start) * OutBounce(time);
      case InOutBounce:
        return start + (end - start) * InOutBounce(time);
    }
    return 0;
  }

  public float Linear(float t) { return t; }

  public float InQuad(float t) { return t * t; }
  public float OutQuad(float t) { return 1 - InQuad(1 - t); }
  public float InOutQuad(float t)
  {
    if (t < 0.5) return InQuad(t * 2) / 2;
    return 1 - InQuad((1 - t) * 2) / 2;
  }

  public float InCubic(float t) { return t * t * t; }
  public float OutCubic(float t){ return 1 - InCubic(1 - t); }
  public float InOutCubic(float t)
  {
    if (t < 0.5) return InCubic(t * 2) / 2;
    return 1 - InCubic((1 - t) * 2) / 2;
  }

  public float InQuart(float t) { return t * t * t * t; }
  public float OutQuart(float t) { return 1 - InQuart(1 - t); }
  public float InOutQuart(float t)
  {
    if (t < 0.5) return InQuart(t * 2) / 2;
    return 1 - InQuart((1 - t) * 2) / 2;
  }

  public float InQuint(float t) { return t * t * t * t * t; }
  public float OutQuint(float t) { return 1 - InQuint(1 - t); }
  public float InOutQuint(float t)
  {
    if (t < 0.5) return InQuint(t * 2) / 2;
    return 1 - InQuint((1 - t) * 2) / 2;
  }

  public float InSine(float t) { return (float)-cos(t * PI / 2); }
  public float OutSine(float t) { return (float)sin(t * PI / 2); }
  public float InOutSine(float t) { return (float)(cos(t * PI) - 1) / -2; }

  public float InExpo(float t) { return (float)pow(2, 10 * (t - 1)); }
  public float OutExpo(float t) { return 1 - InExpo(1 - t); }
  public float InOutExpo(float t)
  {
    if (t < 0.5) return InExpo(t * 2) / 2;
    return 1 - InExpo((1 - t) * 2) / 2;
  }

  public float InCirc(float t) { return -((float)sqrt(1 - t * t) - 1); }
  public float OutCirc(float t) { return 1 - InCirc(1 - t); }
  public float InOutCirc(float t)
  {
    if (t < 0.5) return InCirc(t * 2) / 2;
    return 1 - InCirc((1 - t) * 2) / 2;
  }

  public float InElastic(float t) { return 1 - OutElastic(1 - t); }
  public float OutElastic(float t)
  {
    float p = 0.3f;
    return (float)pow(2, -10 * t) * (float)sin((t - p / 4) * (2 * PI) / p) + 1;
  }
  public float InOutElastic(float t)
  {
    if (t < 0.5) return InElastic(t * 2) / 2;
    return 1 - InElastic((1 - t) * 2) / 2;
  }

  public float InBack(float t)
  {
    float s = 1.70158f;
    return t * t * ((s + 1) * t - s);
  }
  public float OutBack(float t) { return 1 - InBack(1 - t); }
  public float InOutBack(float t)
  {
    if (t < 0.5) return InBack(t * 2) / 2;
    return 1 - InBack((1 - t) * 2) / 2;
  }

  public float InBounce(float t) { return 1 - OutBounce(1 - t); }
  public float OutBounce(float t)
  {
    float div = 2.75f;
    float mult = 7.5625f;

    if (t < 1 / div)
    {
      return mult * t * t;
    }
    else if (t < 2 / div)
    {
      t -= 1.5f / div;
      return mult * t * t + 0.75f;
    }
    else if (t < 2.5 / div)
    {
      t -= 2.25f / div;
      return mult * t * t + 0.9375f;
    }
    else
    {
      t -= 2.625f / div;
      return mult * t * t + 0.984375f;
    }
  }
  public float InOutBounce(float t)
  {
    if (t < 0.5) return InBounce(t * 2) / 2;
    return 1 - InBounce((1 - t) * 2) / 2;
  }
}

public enum EaseType {
    Linear,
    InQuad,
    OutQuad,
    InOutQuad,
    InCubic,
    OutCubic,
    InOutCubic,
    InQuart,
    OutQuart,
    InOutQuart,
    InQuint,
    OutQuint,
    InOutQuint,
    InSine,
    OutSine,
    InOutSine,
    InExpo,
    OutExpo,
    InOutExpo,
    InCirc,
    OutCirc,
    InOutCirc,
    InElastic,
    OutElastic,
    InOutElastic,
    InBack,
    OutBack,
    InOutBack,
    InBounce,
    OutBounce,
    InOutBounce,
}