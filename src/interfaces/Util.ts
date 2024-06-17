import { BaseScene } from "./BaseScene";

export class Util {
  public static InRange(target: number, a: number, b: number): boolean {
    return b >= target && target >= a;
  }

  public static ToStringArray(intArr: number[]): string[] {
    const result: string[] = [];
    for (let i = 0; i < intArr.length; ++i) {
      result[i] = intArr[i].toString();
    }

    return result;
  }

  public static isNullOrEmpty(s: string): boolean {
    return s == null || s.length === 0;
  }

  public static isNullOrWhitespace(s: string): boolean {
    return s == null || this.isWhitespace(s);
  }

  public static isWhitespace(s: string): boolean {
    const length = s.length;
    if (length > 0) {
      for (let i = 0; i < length; i++) {
        if (!/\s/.test(s.charAt(i))) {
          return false;
        }
      }
    }

    return true;
  }

  public static GetSceneNumber(scene: BaseScene): number {
    const className = scene.constructor.name;
    if (className.startsWith("Scene_")) {
      try {
        const sceneNumberStr = className.substring(6);
        return parseInt(sceneNumberStr);
      } catch (e) {
        return -1;
      }
    }
    return -1;
  }
}
