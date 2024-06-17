import { EaseType } from "./EaseType";

const PI = Math.PI;

class EaseMethod {
  public evaluate(
    easeType: EaseType,
    start: number,
    end: number,
    time: number
  ): number {
    switch (easeType) {
      case EaseType.Linear:
        return start + (end - start) * this.Linear(time);
      case EaseType.InQuad:
        return start + (end - start) * this.InQuad(time);
      case EaseType.OutQuad:
        return start + (end - start) * this.OutQuad(time);
      case EaseType.InOutQuad:
        return start + (end - start) * this.InOutQuad(time);
      case EaseType.InCubic:
        return start + (end - start) * this.InCubic(time);
      case EaseType.OutCubic:
        return start + (end - start) * this.OutCubic(time);
      case EaseType.InOutCubic:
        return start + (end - start) * this.InOutCubic(time);
      case EaseType.InQuart:
        return start + (end - start) * this.InQuart(time);
      case EaseType.OutQuart:
        return start + (end - start) * this.OutQuart(time);
      case EaseType.InOutQuart:
        return start + (end - start) * this.InOutQuart(time);
      case EaseType.InQuint:
        return start + (end - start) * this.InQuint(time);
      case EaseType.OutQuint:
        return start + (end - start) * this.OutQuint(time);
      case EaseType.InOutQuint:
        return start + (end - start) * this.InOutQuint(time);
      case EaseType.InSine:
        return start + (end - start) * this.InSine(time);
      case EaseType.OutSine:
        return start + (end - start) * this.OutSine(time);
      case EaseType.InOutSine:
        return start + (end - start) * this.InOutSine(time);
      case EaseType.InExpo:
        return start + (end - start) * this.InExpo(time);
      case EaseType.OutExpo:
        return start + (end - start) * this.OutExpo(time);
      case EaseType.InOutExpo:
        return start + (end - start) * this.InOutExpo(time);
      case EaseType.InCirc:
        return start + (end - start) * this.InCirc(time);
      case EaseType.OutCirc:
        return start + (end - start) * this.OutCirc(time);
      case EaseType.InOutCirc:
        return start + (end - start) * this.InOutCirc(time);
      case EaseType.InElastic:
        return start + (end - start) * this.InElastic(time);
      case EaseType.OutElastic:
        return start + (end - start) * this.OutElastic(time);
      case EaseType.InOutElastic:
        return start + (end - start) * this.InOutElastic(time);
      case EaseType.InBack:
        return start + (end - start) * this.InBack(time);
      case EaseType.OutBack:
        return start + (end - start) * this.OutBack(time);
      case EaseType.InOutBack:
        return start + (end - start) * this.InOutBack(time);
      case EaseType.InBounce:
        return start + (end - start) * this.InBounce(time);
      case EaseType.OutBounce:
        return start + (end - start) * this.OutBounce(time);
      case EaseType.InOutBounce:
        return start + (end - start) * this.InOutBounce(time);
    }
  }
  Linear(t: number): number {
    return t;
  }

  InQuad(t: number): number {
    return t * t;
  }

  OutQuad(t: number): number {
    return 1 - this.InQuad(1 - t);
  }

  InOutQuad(t: number): number {
    if (t < 0.5) return this.InQuad(t * 2) / 2;
    return 1 - this.InQuad((1 - t) * 2) / 2;
  }

  InCubic(t: number): number {
    return t * t * t;
  }

  OutCubic(t: number): number {
    return 1 - this.InCubic(1 - t);
  }

  InOutCubic(t: number): number {
    if (t < 0.5) return this.InCubic(t * 2) / 2;
    return 1 - this.InCubic((1 - t) * 2) / 2;
  }

  InQuart(t: number): number {
    return t * t * t * t;
  }

  OutQuart(t: number): number {
    return 1 - this.InQuart(1 - t);
  }

  InOutQuart(t: number): number {
    if (t < 0.5) return this.InQuart(t * 2) / 2;
    return 1 - this.InQuart((1 - t) * 2) / 2;
  }

  InQuint(t: number): number {
    return t * t * t * t * t;
  }

  OutQuint(t: number): number {
    return 1 - this.InQuint(1 - t);
  }

  InOutQuint(t: number): number {
    if (t < 0.5) return this.InQuint(t * 2) / 2;
    return 1 - this.InQuint((1 - t) * 2) / 2;
  }

  InSine(t: number): number {
    return -Math.cos((t * PI) / 2);
  }

  OutSine(t: number): number {
    return Math.sin((t * PI) / 2);
  }

  InOutSine(t: number): number {
    return (Math.cos(t * PI) - 1) / -2;
  }

  InExpo(t: number): number {
    return Math.pow(2, 10 * (t - 1));
  }

  OutExpo(t: number): number {
    return 1 - this.InExpo(1 - t);
  }

  InOutExpo(t: number): number {
    if (t < 0.5) return this.InExpo(t * 2) / 2;
    return 1 - this.InExpo((1 - t) * 2) / 2;
  }

  InCirc(t: number): number {
    return -(Math.sqrt(1 - t * t) - 1);
  }

  OutCirc(t: number): number {
    return 1 - this.InCirc(1 - t);
  }

  InOutCirc(t: number): number {
    if (t < 0.5) return this.InCirc(t * 2) / 2;
    return 1 - this.InCirc((1 - t) * 2) / 2;
  }

  InElastic(t: number): number {
    return 1 - this.OutElastic(1 - t);
  }

  OutElastic(t: number): number {
    const p = 0.3;
    return Math.pow(2, -10 * t) * Math.sin(((t - p / 4) * (2 * PI)) / p) + 1;
  }

  InOutElastic(t: number): number {
    if (t < 0.5) return this.InElastic(t * 2) / 2;
    return 1 - this.InElastic((1 - t) * 2) / 2;
  }

  InBack(t: number): number {
    const s = 1.70158;
    return t * t * ((s + 1) * t - s);
  }

  OutBack(t: number): number {
    return 1 - this.InBack(1 - t);
  }

  InOutBack(t: number): number {
    if (t < 0.5) return this.InBack(t * 2) / 2;
    return 1 - this.InBack((1 - t) * 2) / 2;
  }

  InBounce(t: number): number {
    return 1 - this.OutBounce(1 - t);
  }

  OutBounce(t: number): number {
    const div = 2.75;
    const mult = 7.5625;

    if (t < 1 / div) {
      return mult * t * t;
    } else if (t < 2 / div) {
      t -= 1.5 / div;
      return mult * t * t + 0.75;
    } else if (t < 2.5 / div) {
      t -= 2.25 / div;
      return mult * t * t + 0.9375;
    } else {
      t -= 2.625 / div;
      return mult * t * t + 0.984375;
    }
  }

  InOutBounce(t: number): number {
    if (t < 0.5) return this.InBounce(t * 2) / 2;
    return 1 - this.InBounce((1 - t) * 2) / 2;
  }
}

export const easeMethod = new EaseMethod();
