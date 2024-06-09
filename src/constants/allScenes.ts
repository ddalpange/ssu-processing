import { BaseScene } from "../interfaces/BaseScene";
import { Scene_101 } from "../scenes/Scene_101";
import { Scene_102 } from "../scenes/Scene_102";

export const allScenes: Record<number, () => BaseScene> = {
  101: () => new Scene_101(),

  102: () => new Scene_102(),
};
