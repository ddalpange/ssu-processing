int DIALOG_HEIGHT = 200;
int DIALOG_PADDING = 16;
int DIALOG_MARGIN = 10;
int TELLER_TEXT_SIZE = 24;
int MSG_TEXT_SIZE = 16;

import java.util.Queue;
import java.util.LinkedList;

public class DialogUi {
    private boolean visible;
    private DialogContent current;
    private Queue<DialogContent> queue = new LinkedList<>();

    private int x;
    private int y;

    public DialogUi() {
        this.visible = false;
        current = new DialogContent("0", "", "");
        this.x = width / 4;
        this.y = height - DIALOG_HEIGHT - (DIALOG_MARGIN * 2); // 20 은 MARGIN
    }

    private void drawDialogBox() {
        String msg = this.current.text;
        if (msg == null || msg == "") {
            return;
        }

        pushStyle();
        strokeWeight(1);
        fill(255, 255, 255, 200);
        rect(this.x, this.y, width/2, DIALOG_HEIGHT, 5);
        popStyle();
    }

    private void drawText() {
        int textAnchor = this.y + DIALOG_PADDING * 2;
        if (this.current.teller != null) {
            //textSize(TELLER_TEXT_SIZE);
            fill(0, 0, 255);
            fontManager.drawText(this.current.teller, x + DIALOG_PADDING, y + DIALOG_PADDING * 2, TELLER_TEXT_SIZE);
            //text(this.current.teller, x + DIALOG_PADDING, y + DIALOG_PADDING * 2);
            textAnchor = this.y + DIALOG_PADDING * 2 + TELLER_TEXT_SIZE + 10;
        }
        //textSize(MSG_TEXT_SIZE);
        fill(0, 0, 0);
        String msg = this.current.text.replace("\\n","\n");
        fontManager.drawText(msg, x + DIALOG_PADDING, textAnchor, width/2 - DIALOG_PADDING*2, 1000, MSG_TEXT_SIZE);
        //text(this.current.text,
        //x + DIALOG_PADDING,
        //textAnchor,
        //width/2 - DIALOG_PADDING * 2,
        //1000);
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
        if (this.queue.size() > 0) {
            this.current = this.queue.poll();
            return true;
        }

        return false;
    }

    public void push(String msg, String teller) {
        this.queue.add(new DialogContent("0", msg, teller));
    }

    public String getCurrentId() {
        return this.current.id;
    }
}
