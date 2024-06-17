import { allScenes } from '../constants/allScenes';
import { Drawable } from './Drawable';
import { sceneManager } from './SceneManager';

export class GhostLegGameManager {
    protected legCount: number = 0;
    protected sceneNums: number[] = [];
    protected drawables: Drawable[] = [];

    constructor(legCount: number, scenes: number[], drawables: Drawable[]) {
        if (legCount < 0) {
            throw new Error("Leg count must be greater than 0");
        } else if (scenes.length != legCount) {
            throw new Error("Leg count must match the number of scenes");
        } else if (drawables.length != legCount) {
            throw new Error("Leg count must match the number of drawables");
        }

        this.legCount = legCount;
        this.sceneNums = [...scenes];
        this.drawables = [...drawables];
    }

    public update(): void {
        for (let i = 0; i < this.drawables.length; i++) {
            let d = this.drawables[i];
            let s = this.sceneNums[i];
            if (d.isMouseClicked() && s > 0) {
                sceneManager.loadScene(allScenes[s]());
            }
        }
    }
}