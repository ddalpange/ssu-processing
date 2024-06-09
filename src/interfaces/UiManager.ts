import { ScenarioScript } from "../constants/ScenarioScript";
import { BaseScene } from "./BaseScene";
import { DialogContent } from "./DialogContent";
import { DialogUi } from "./DialogUi";

const rawToContent = (data: any): DialogContent => {
  if (data == null) {
    console.error("잘못된 데이터가 들어왔어요.");
  }
  let id = data["id"];
  let text = data["comment"];
  let teller = data["character"];
  let voice = data["voice"];
  const dialogContent = new DialogContent(id, text, teller, voice);
  return dialogContent;
};
export class UiManager {
  public dialogUi: DialogUi;

  public constructor() {
    this.dialogUi = new DialogUi();
    this.dialogUi.show();
  }

  public getDialogDataById(id: string): DialogContent {
    const data = ScenarioScript.find((item) => item.id === id);
    // if (Util.isNullOrWhitespace(voice) === false) {
    //   voice = "res/sound/voice/" + voice + ".mp3";
    // } else {
    //   voice = null;
    // }

    return rawToContent(data);
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
    }).map((v) => rawToContent(v)) as DialogContent[];

    return contents;
  }
}
