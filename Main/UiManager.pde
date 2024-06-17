String locale = "en"; // or "ko"

public class UiManager {
  public DialogUi dialogUi;
  List<Map<String, String>> currentDialogList;
  TsvProcessor tsvProcessor;

  private UiManager(){
    super();
    reloadDialogs();

    dialogUi = new DialogUi();
    dialogUi.show();
  }

  public void reloadDialogs() {
    tsvProcessor = new TsvProcessor("Data/ScenarioScript_" + locale + ".tsv");
    var s1 = tsvProcessor.readTsvFile();

    currentDialogList = new ArrayList<Map<String, String>>();
    currentDialogList.addAll(s1);
  }

  public DialogContent getDialogDataById(String id) {
    Map<String, String> data = tsvProcessor.getDataById(currentDialogList, id);
    if (data == null) {
        println("No data found for id: " + id);
        return null;
    }
    String text = data.get("comment");
    String teller = data.get("character");
    String voice = data.get("voice");
    if (Util.isNullOrWhitespace(voice) == false) {
      voice = "res/sound/voice/" + voice + ".mp3";
    } else {
      voice = null;
    }
    println("voice : " + voice);
    
    DialogContent dialogContent = new DialogContent(id, text, teller, voice);
    return dialogContent;
  }

  public void drawing () {
    dialogUi.draw();
  }

  public void mousePressed(){

  }

  public DialogContent[] getDialogForScene(BaseScene scene) {
     String className = scene.getClass().getSimpleName();
      // 클래스 이름이 "Scene_"으로 시작하는지 확인
      if (className.startsWith("Scene_")) {
        String sceneNumberStr = className.substring(6);
          // 대사가 100개가 넘을 일은 없을거야..
          ArrayList<DialogContent> contents = new ArrayList<DialogContent>();
          for (int i = 0; i < 100; ++i) {
            String id = sceneNumberStr + String.format("%03d", i);
            Map<String, String> data = tsvProcessor.getDataById(currentDialogList, id);
            if (data == null)
              continue;
            
            contents.add(getDialogDataById(id));
          }

          return contents.toArray(new DialogContent[0]);
      } else {
          return new DialogContent[0];
      }
  }
}
