import { BaseScene } from "../interfaces/BaseScene";
import { Scene_101 } from "../scenes/Scene_101";
import { Scene_102 } from "../scenes/Scene_102";
import { Scene_103 } from "../scenes/Scene_103";
import { Scene_104 } from "../scenes/Scene_104";
import { Scene_105 } from "../scenes/Scene_105";
import { Scene_106 } from "../scenes/Scene_106";
import { Scene_107 } from "../scenes/Scene_107";
import { Scene_108 } from "../scenes/Scene_108";
import { Scene_109 } from "../scenes/Scene_109";
import { Scene_110 } from "../scenes/Scene_110";
import { Scene_111 } from "../scenes/Scene_111";
import { Scene_112 } from "../scenes/Scene_112";
import { Scene_113 } from "../scenes/Scene_113";
import { Scene_114 } from "../scenes/Scene_114";
import { Scene_201 } from "../scenes/Scene_201";
import { Scene_202 } from "../scenes/Scene_202";
import { Scene_203 } from "../scenes/Scene_203";
import { Scene_204 } from "../scenes/Scene_204";
import { Scene_205 } from "../scenes/Scene_205";
import { Scene_206 } from "../scenes/Scene_206";
import { Scene_207 } from "../scenes/Scene_207";

export const allScenes: Record<number, () => BaseScene> = {
  101: () => new Scene_101(),

  102: () => new Scene_102(),

  103: () => new Scene_103(),

  104: () => new Scene_104(),

  105: () => new Scene_105(),

  106: () => new Scene_106(),

  107: () => new Scene_107(),

  108: () => new Scene_108(),

  109: () => new Scene_109(),

  110: () => new Scene_110(),

  111: () => new Scene_111(),

  112: () => new Scene_112(),

  113: () => new Scene_113(),

  114: () => new Scene_114(),

  201: () => new Scene_201(),

  202: () => new Scene_202(),

  203: () => new Scene_203(),

  204: () => new Scene_204(),

  205: () => new Scene_205(),

  206: () => new Scene_206(),

  207: () => new Scene_207(),
};
