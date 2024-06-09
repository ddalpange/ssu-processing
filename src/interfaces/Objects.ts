import { DrawManager } from "./DrawManager";
import { ShapeObject } from "./ShapeObject";
export enum CharacterType {
  tiger = "tiger",
  boy = "boy",
  girl = "girl",
  mom = "mom",
  tiger_mom = "tiger_mom",
}

export enum CharacterPoseType {
  front = "f",
  left = "left",
  climb = "climb",
  climb_rope = "climb_rope",
  black = "black",
  fall = "fall",
  point = "point",
  pray = "pray",
  seat = "seat",
  smile = "smile",
  front_ricecake = "front_ricecake",
  back_ricecake = "back_ricecake",
  hand = "hand",
  back = "b",
  lay = "lay",

  // tiger only
  hungry = "hungry",
  knock = "knock",
  lay_01 = "lay_01",
  lay_02 = "lay_02",
  lay_03 = "lay_03",
  angry = "angry",
  big = "big",
  mouth = "mouth",
  ricecake_01 = "ricecake_01",
  ricecake_02 = "ricecake_02",
  ricecake_03_01 = "ricecake_03_01",
  ricecake_03_02 = "ricecake_03_02",
  scream = "scream",
  thirsty = "thirsty",
  threat = "threat",
  well = "well",
}

export class ObjectFactory {
  public getShapePath(type: CharacterType, pose: CharacterPoseType) {
    const prefix = "res/images/character/";
    const extension = ".png";
    //String extension = useSvg ? ".svg" : ".png";
    return prefix + type + "_" + pose + extension;
  }
  public createCombination(type: CharacterType, pose: CharacterPoseType) {
    return new ShapeObject(this.getShapePath(type, pose));
  }
  public create(path: string) {
    return new ShapeObject(path);
  }
}

export const objectFactory = new ObjectFactory();

export function loadBackground(id: string, drawManager: DrawManager): void {
  const path = `res/images/bg/background_${id}.png`;
  const obj = objectFactory.create(path);
  obj.setPosition(p.width / 2, p.height / 2);
  drawManager.addDrawable(obj);
}
