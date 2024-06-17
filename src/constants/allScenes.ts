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
import { Scene_208 } from "../scenes/Scene_208";
import { Scene_209 } from "../scenes/Scene_209";
import { Scene_210 } from "../scenes/Scene_210";
import { Scene_211 } from "../scenes/Scene_211";
import { Scene_212 } from "../scenes/Scene_212";
import { Scene_213 } from "../scenes/Scene_213";
import { Scene_214 } from "../scenes/Scene_214";
import { Scene_215 } from "../scenes/Scene_215";
import { Scene_216 } from "../scenes/Scene_216";
import { Scene_217 } from "../scenes/Scene_217";
import { Scene_218 } from "../scenes/Scene_218";
import { Scene_219 } from "../scenes/Scene_219";
import { Scene_220 } from "../scenes/Scene_220";
import { Scene_221 } from "../scenes/Scene_221";
import { Scene_222 } from "../scenes/Scene_222";
import { Scene_301 } from "../scenes/Scene_301";
import { Scene_302 } from "../scenes/Scene_302";
import { Scene_303 } from "../scenes/Scene_303";
import { Scene_304 } from "../scenes/Scene_304";
import { Scene_305 } from "../scenes/Scene_305";
import { Scene_306 } from "../scenes/Scene_306";
import { Scene_307 } from "../scenes/Scene_307";
import { Scene_308 } from "../scenes/Scene_308";
import { Scene_309 } from "../scenes/Scene_309";
import { Scene_310 } from "../scenes/Scene_310";
import { Scene_311 } from "../scenes/Scene_311";
import { Scene_312 } from "../scenes/Scene_312";
import { Scene_313 } from "../scenes/Scene_313";
import { Scene_314 } from "../scenes/Scene_314";
import { Scene_315 } from "../scenes/Scene_315";
import { Scene_316 } from "../scenes/Scene_316";
import { Scene_317 } from "../scenes/Scene_317";
import { Scene_318 } from "../scenes/Scene_318";
import { Scene_319 } from "../scenes/Scene_319";
import { Scene_320 } from "../scenes/Scene_320";
import { Scene_321 } from "../scenes/Scene_321";
import { Scene_322 } from "../scenes/Scene_322";
import { Scene_323 } from "../scenes/Scene_323";
import { Scene_324 } from "../scenes/Scene_324";
import { Scene_325 } from "../scenes/Scene_325";
import { Scene_326 } from "../scenes/Scene_326";
import { Scene_327 } from "../scenes/Scene_327";
import { Scene_328 } from "../scenes/Scene_328";
import { Scene_329 } from "../scenes/Scene_329";
import { Scene_330 } from "../scenes/Scene_330";

import { Scene_Intro_New } from "../scenes/Scene_Intro_New";

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

  208: () => new Scene_208(),

  209: () => new Scene_209(),

  210: () => new Scene_210(),

  211: () => new Scene_211(),

  212: () => new Scene_212(),

  213: () => new Scene_213(),

  214: () => new Scene_214(),

  215: () => new Scene_215(),

  216: () => new Scene_216(),

  217: () => new Scene_217(),

  218: () => new Scene_218(),

  219: () => new Scene_219(),

  220: () => new Scene_220(),

  221: () => new Scene_221(),

  222: () => new Scene_222(),

  301: () => new Scene_301(),

  302: () => new Scene_302(),

  303: () => new Scene_303(),

  304: () => new Scene_304(),

  305: () => new Scene_305(),

  306: () => new Scene_306(),

  307: () => new Scene_307(),

  308: () => new Scene_308(),

  309: () => new Scene_309(),

  310: () => new Scene_310(),

  311: () => new Scene_311(),

  312: () => new Scene_312(),

  313: () => new Scene_313(),

  314: () => new Scene_314(),

  315: () => new Scene_315(),

  316: () => new Scene_316(),

  317: () => new Scene_317(),

  318: () => new Scene_318(),

  319: () => new Scene_319(),

  320: () => new Scene_320(),

  321: () => new Scene_321(),

  322: () => new Scene_322(),

  323: () => new Scene_323(),

  324: () => new Scene_324(),

  325: () => new Scene_325(),

  326: () => new Scene_326(),

  327: () => new Scene_327(),

  328: () => new Scene_328(),

  329: () => new Scene_329(),

  330: () => new Scene_330(),
};

export const allSceneNumbers: number[] = [
  101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 201,
  202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216,
  217, 218, 219, 220, 221, 222, 301, 302, 303, 304, 305, 306, 307, 308, 309,
  310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324,
  325, 326, 327, 328, 329, 330,
];

export function createIntroScene(): BaseScene {
  return new Scene_Intro_New();
}
