import { BaseScene } from "../interfaces/BaseScene";
import { Scene_101 } from "../scenes/Scene_101";
import { Scene_102 } from "../scenes/Scene_102";
import { Scene_103 } from "../scenes/Scene_103";
import { Scene_104 } from "../scenes/Scene_104";
import { Scene_105 } from "../scenes/Scene_105";

export const allScenes: Record<number, () => BaseScene> = {
  101: () => new Scene_101(),

  102: () => new Scene_102(),

  103: () => new Scene_103(),

  104: () => new Scene_104(),

  105: () => new Scene_105(),
};
