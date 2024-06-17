public class BaseAnimation {
  public BaseAnimation(Drawable target) {
      this.target = target;
  }
  public Drawable target;
  public float duration;
  public EaseType easeType = EaseType.Linear;
  public boolean isDone;

  // repeatCount == -1 for infinite
  // repeatCount == 0  for one direciton
  // repeatCount > 0   for repeat
  public int repeatCount = 0;
  
  protected boolean reverse;

  public void update() {
  }

  public void setEaseType(EaseType ease)
  {
    easeType = ease;
  }
}


public class MoveAnimation extends BaseAnimation {
  public MoveAnimation(Drawable target) {
      super(target);
      startX = target.getX();
      startY = target.getY();
  }

  public MoveAnimation(Drawable target, float destX, float destY, float duration) {
      super(target);
      startX = target.getX();
      startY = target.getY();
      this.destX = destX;
      this.destY = destY;
      this.duration = duration;
  }

    public MoveAnimation(Drawable target, float destX, float destY, float duration, EaseType ease) {
      super(target);
      startX = target.getX();
      startY = target.getY();
      this.destX = destX;
      this.destY = destY;
      this.duration = duration;
      setEaseType(ease);
  }

  public float destX;
  public float destY;

  private float startX;
  private float startY;

  private float duration;
  private float elapsedTime;

  @Override
  public void update() {
    elapsedTime += deltaTime;
    float t = elapsedTime / duration;
    if (t > 1.0f) {
      t = 1.0f;
      isDone = true;
    }

    float currentX = easeMethod.evaluate(easeType, startX, destX, t);
    float currentY = easeMethod.evaluate(easeType, startY, destY, t);

    target.setPosition((int)currentX, (int)currentY);

    if (isDone && (repeatCount != 0)) {
      if (repeatCount > 0) {
        repeatCount--;
      }

      if (reverse) {
        if (repeatCount != 0) {
          repeatCount--;
          if (repeatCount == 0) {
            return;
          }
        }
      }

      reverse = !reverse;
      
      float temp = startX;
      startX = destX;
      destX = temp;

      temp = startY;
      startY = destY;
      destY = temp;
      isDone = false;
      elapsedTime = 0;
    }
  }

  public MoveAnimation reset() // 하나의 객체를 돌려쓸때 사용
  {
    elapsedTime = 0;
    isDone = false;
    startX = target.getX();
    startY = target.getY();
    return this;
  }
}

public class ScaleAnimation extends BaseAnimation {
  public ScaleAnimation(Drawable target) {
      super(target);
      startX = target.getScaleX();
      startY = target.getScaleY();
  }

  public ScaleAnimation(Drawable target, float destX, float destY, float duration) {
      super(target);
      startX = target.getScaleX();
      startY = target.getScaleY();
      this.destX = destX;
      this.destY = destY;
      this.duration = duration;
  }

  public ScaleAnimation(Drawable target, float destX, float destY, float duration, EaseType ease) {
      super(target);
      startX = target.getScaleX();
      startY = target.getScaleY();
      this.destX = destX;
      this.destY = destY;
      this.duration = duration;
      setEaseType(ease);
  }

  public float destX;
  public float destY;

  private float startX;
  private float startY;

  private float duration;
  private float elapsedTime;

  @Override
  public void update() {
    elapsedTime += deltaTime;
    float t = elapsedTime / duration;
    if (t > 1.0f) {
      t = 1.0f;
      isDone = true;
    }

    float currentScaleX = easeMethod.evaluate(easeType, startX, destX, t);
    float currentScaleY = easeMethod.evaluate(easeType, startY, destY, t);

    target.setScale(currentScaleX, currentScaleY);

    if (isDone && (repeatCount != 0)) {
      if (repeatCount > 0) {
        repeatCount--;
      }

      if (reverse) {
        if (repeatCount != 0) {
          repeatCount--;
          if (repeatCount == 0) {
            return;
          }
        }
      }

      reverse = !reverse;
      
      float temp = startX;
      startX = destX;
      destX = temp;

      temp = startY;
      startY = destY;
      destY = temp;
      isDone = false;
      elapsedTime = 0;
    }
  }

    public ScaleAnimation reset() // 하나의 객체를 돌려쓸때 사용
  {
    elapsedTime = 0;
    isDone = false;
    startX = target.getScaleX();
    startY = target.getScaleY();
    return this;
  }
}
