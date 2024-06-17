import { Drawable } from "./Drawable";
import { EaseType } from "./EaseType";

export class BaseAnimation {
  public target: Drawable;
  public duration: number | undefined;
  public easeType: EaseType = EaseType.Linear;
  public isDone: boolean = false;

  // repeatCount == -1 for infinite
  // repeatCount == 0  for one direciton
  // repeatCount > 0   for repeat
  public repeatCount: number = 0;

  protected reverse: boolean = false;

  constructor(target: Drawable) {
    this.target = target;
  }

  public update(): void {}

  public setEaseType(ease: EaseType): void {
    this.easeType = ease;
  }
}
