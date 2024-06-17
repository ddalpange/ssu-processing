//int DIALOG_HEIGHT = 200;
//int DIALOG_PADDING = 16;
//int DIALOG_MARGIN = 10;
int TELLER_TEXT_SIZE = 28;
int MSG_TEXT_SIZE = 18;

import java.util.Queue;
import java.util.LinkedList;

public class DialogUi {
    private boolean visible;
    public DialogContent current;
    private Queue<DialogContent> queue = new LinkedList<>();

    private int x;
    private int y;
    private int imageWidth;
    private int imageHeight;
    private PImage uiImage;

    int charIndex = 0;
    float frameElapsed = 0;
    float frameCounterTime = 0.25;

    public DialogUi() {
        this.visible = false;
        current = new DialogContent("0", "", "", null);
        this.uiImage = loadImage("res/images/ui/subtitle_bar_new.png");
        //this.imageWidth = uiImage.width + 200;
        this.imageWidth = uiImage.width;
        this.imageHeight = uiImage.height;
        this.x = width / 2 - imageWidth / 2;
        this.y = 500;
        //this.x = width / 4;
        // this.y = height - DIALOG_HEIGHT - (DIALOG_MARGIN * 2); // 20 은 MARGIN
    }

    private void drawDialogBox() {
        String msg = this.current.text;
        if (msg == null || msg == "") {
            return;
        }

        pushStyle();

        // alpha
        tint(255, 190);
        image(uiImage, x, y, imageWidth, imageHeight);

        popStyle();
    }

    private void drawText() {
        //int textAnchor = this.y + DIALOG_PADDING * 2;
        if (this.current.teller != null) {
            //textSize(TELLER_TEXT_SIZE);
            fill(0, 0, 255);
            pushStyle();
            textAlign(CENTER, CENTER);
            fontManager.drawText(this.current.teller, x + imageWidth / 2, y + 50, TELLER_TEXT_SIZE);
            popStyle();
            //fontManager.drawText(this.current.teller, x + DIALOG_PADDING, y + DIALOG_PADDING * 2, TELLER_TEXT_SIZE);
            //text(this.current.teller, x + DIALOG_PADDING, y + DIALOG_PADDING * 2);
            //textAnchor = this.y + DIALOG_PADDING * 2 + TELLER_TEXT_SIZE + 10;
        }
        fill(0, 0, 0);
        
        String msg = this.current.text.replace("\\n","\n");
        if (frameElapsed >= frameCounterTime && charIndex < msg.length()) {
            charIndex++;
        } else if (charIndex >= msg.length()) {
            charIndex = msg.length();
        }

        String showingText = msg.substring(0, charIndex);

        fontManager.drawText(showingText, x + 130, this.y + 75, imageWidth - 250, imageHeight - 80, MSG_TEXT_SIZE);
        frameElapsed += deltaTime;
    }

    private void draw() {
        // 기본 DIALOG BOX Render
        if (this.visible) {
            this.drawDialogBox();
            this.drawText();
        }
    }

    public void show() {
        this.visible = true;
    }

    public void hide() {
        this.visible = false;
    }

    public boolean isVisible() {
        return this.visible;
    }

    public void set(DialogContent content) {
        this.current = content;
        this.queue.clear();
    }

    public void enqueue(DialogContent content) {
        this.queue.add(content);
    }

    public void enqueueAll(DialogContent[] contents) {
        for (var content : contents)
            this.queue.add(content);
    }

    // true : 대화 표시 성공, false : 대화 표시 실패
    public boolean next() {
        String msg = this.current.text.replace("\\n","\n");
        if (charIndex < msg.length()) {
            charIndex = msg.length();
            return true;
        }

        stopPlayingVoice();

        if (this.queue.size() > 0) {
            this.resetTextAnimation();
            this.current = this.queue.poll();
            if (this.current.voicePath != null) {
                lastPlayedSoundFile = soundManager.playOnce(this.current.voicePath);
            }
            return true;
        }

        return false;
    }

    void resetTextAnimation () {
        this.frameElapsed = 0;
        this.charIndex = 0;
    }

    public void push(String msg, String teller) {
        this.resetTextAnimation();
        this.queue.add(new DialogContent("0", msg, teller, null));
    }

    public String getCurrentId() {
        return this.current.id;
    }
}

// DialogUi 자체가 씬별로 생성되어서 전역 변수로 처리해야 함.
SoundFile lastPlayedSoundFile = null;

void stopPlayingVoice() {
    if (lastPlayedSoundFile == null)
        return;

    lastPlayedSoundFile.stop();
    lastPlayedSoundFile.removeFromCache();
    lastPlayedSoundFile = null;
}