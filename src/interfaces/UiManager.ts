import { ScenarioScript } from "../constants/ScenarioScript";
import { BaseScene } from "./BaseScene";
import { DialogContent } from "./DialogContent";
import { DialogUi } from "./DialogUi";

export class UiManager {
  public dialogUi: DialogUi;

  public constructor() {
    this.dialogUi = new DialogUi();
    this.dialogUi.show();
  }

  public getDialogDataById(id: string): DialogContent {
    const data = ScenarioScript.find((item) => item.id === id);
    if (data == null) {
      throw Error(`찾을 수 없음: ${id}`);
    }
    let text = data["comment"];
    let teller = data["character"];
    let voice = data["voice"];
    // if (Util.isNullOrWhitespace(voice) === false) {
    //   voice = "res/sound/voice/" + voice + ".mp3";
    // } else {
    //   voice = null;
    // }
    const dialogContent = new DialogContent(id, text, teller, voice);
    return dialogContent;
  }

  public drawing() {
    this.dialogUi.draw();
  }

  public mousePressed() {}

  public getDialogForScene(scene: BaseScene): DialogContent[] {
    const className = scene.constructor.name;
    const sceneNumberStr = className.replace("Scene_", "");
    const contents = ScenarioScript.filter((item) => {
      return item.id.startsWith(sceneNumberStr);
    }) as DialogContent[];

    return contents;
  }
}
