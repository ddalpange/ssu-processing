import { DrawManager } from "./DrawManager";
import { ShapeObject } from "./ShapeObject";
import { SpriteAnimation } from "./SpriteAnimation";
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
    left_half = "left_half",
    climb = "climb",
    climb_rope = "climb_rope",
    black = "black",
    fall = "fall",
    fall_purple = "fall_purple",
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
    well_ = "well_",
    well_1 = "well_1",
    well_anim_1 = "well_anim_1",
    well_anim_2 = "well_anim_2",
    well_anim_3 = "well_anim_3",
    well_2_1 = "well_2_1",
    well_2_2 = "well_2_2"
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


    public createAnimation(type: CharacterType, pose: string, count: number): SpriteAnimation | null {
        // type_pose_anim_1~count.png
        let path = "res/images/character/" + type + "_" + pose + "_anim_";
        let paths: string[] = [];
        for (let i = 1; i <= count; i++) {
            let fullPath = path + i + ".png";
            paths.push(fullPath);
        }

        return new SpriteAnimation(paths);
    }
}

export const objectFactory = new ObjectFactory();

export function loadBackground(id: string, drawManager: DrawManager): void {
    const path = `res/images/bg/background_${id}.png`;
    const obj = objectFactory.create(path);
    obj.setPosition(p.width / 2, p.height / 2);
    drawManager.addDrawable(obj);
}
