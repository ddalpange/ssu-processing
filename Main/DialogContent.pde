public class DialogContent {
    public String id;
    public String text;
    public String teller;
    public String voicePath;

    public DialogContent(String id, String text) {
        this.id = id;
        this.text = text;
        this.teller = null;
        this.voicePath = null;
    }

    public DialogContent(String id, String text, String teller, String voicePath) {
        this.id = id;
        this.text = text;
        this.teller = teller;
        this.voicePath = voicePath;
    }
}