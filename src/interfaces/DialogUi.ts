import { DialogContent } from "./DialogContent";
import { fontManager } from "./FontManager";

const DIALOG_HEIGHT: number = 200;
const DIALOG_PADDING: number = 16;
const DIALOG_MARGIN: number = 10;
const TELLER_TEXT_SIZE: number = 24;
const MSG_TEXT_SIZE: number = 16;

export class DialogUi {
  private visible: boolean;
  private current: DialogContent;
  private queue: DialogContent[] = [];

  private x: number;
  private y: number;

  constructor() {
    this.visible = false;
    this.current = new DialogContent("0", "");
    this.x = p.width / 4;
    this.y = p.height - DIALOG_HEIGHT - DIALOG_MARGIN * 2; // 20 is MARGIN
    fontManager.setup();
  }

  private drawDialogBox(): void {
    const msg: string = this.current.text;
    if (msg == null || msg === "") {
      return;
    }

    p.push();
    p.strokeWeight(1);
    p.fill(255, 255, 255, 200);
    p.rect(this.x, this.y, p.width / 2, DIALOG_HEIGHT, 5);
    p.pop();
  }

  private drawText(): void {
    let textAnchor: number = this.y + DIALOG_PADDING * 2;
    if (this.current.teller != null) {
      //textSize(TELLER_TEXT_SIZE);
      p.fill(0, 0, 255);
      fontManager.drawText2(
        this.current.teller,
        this.x + DIALOG_PADDING,
        this.y + DIALOG_PADDING * 2,
        TELLER_TEXT_SIZE
      );
      //text(this.current.teller, x + DIALOG_PADDING, y + DIALOG_PADDING * 2);
      textAnchor = this.y + DIALOG_PADDING * 2 + TELLER_TEXT_SIZE + 10;
    }
    //textSize(MSG_TEXT_SIZE);
    p.fill(0, 0, 0);
    const msg: string = this.current.text.replace("\\n", "\n");
    fontManager.drawText(
      msg,
      this.x + DIALOG_PADDING,
      textAnchor,
      p.width / 2 - DIALOG_PADDING * 2,
      1000,
      MSG_TEXT_SIZE
    );
    //text(this.current.text,
    //x + DIALOG_PADDING,
    //textAnchor,
    //width/2 - DIALOG_PADDING * 2,
    //1000);
  }

  public draw(): void {
    // Default DIALOG BOX Render
    if (this.visible) {
      this.drawDialogBox();
      this.drawText();
    }
  }

  public show(): void {
    this.visible = true;
  }

  public hide(): void {
    this.visible = false;
  }

  public set(content: DialogContent): void {
    this.current = content;
    this.queue = [];
  }

  public enqueue(content: DialogContent): void {
    this.queue.push(content);
  }

  public enqueueAll(contents: DialogContent[]): void {
    this.queue.push(...contents);
  }

  // true : 대화 표시 성공, false : 대화 표시 실패
  public next(): boolean {
    // stopPlayingVoice();
    const el = this.queue.shift();
    if (el) {
      this.current = el;
      // if (this.current.voicePath != null) {
      //   lastPlayedSoundFile = soundManager.playOnce(this.current.voicePath);
      // }
      return true;
    }

    return false;
  }

  public push(msg: string, teller: string): void {
    this.queue.push(new DialogContent("0", msg, teller, undefined));
  }

  public getCurrentId(): string {
    return this.current.id;
  }
}

// // DialogUi 자체가 씬별로 생성되어서 전역 변수로 처리해야 함.
// let lastPlayedSoundFile: SoundFile | null = null;

// function stopPlayingVoice(): void {
//   if (lastPlayedSoundFile == null) {
//     return;
//   }

//   lastPlayedSoundFile.stop();
//   lastPlayedSoundFile.removeFromCache();
//   lastPlayedSoundFile = null;
// }
