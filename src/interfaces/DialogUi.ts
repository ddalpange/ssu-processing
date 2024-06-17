import p5 from "p5";
import { DialogContent } from "./DialogContent";

const TELLER_TEXT_SIZE = 28;
const MSG_TEXT_SIZE = 18;

export class DialogUi {
    public visible: boolean;
    public current: DialogContent;
    private queue: DialogContent[] = [];
    private x: number = 0;
    private y: number = 0;
    private imageWidth: number = 0;
    private imageHeight: number = 0;
    private uiImage: p5.Image | undefined;

    private charIndex: number = 0;
    private frameElapsed: number = 0;
    private frameCounterTime: number = 0.25;

    constructor() {
        this.visible = false;
        this.current = new DialogContent("0", "", "", undefined);

        p.loadImage("res/images/ui/subtitle_bar_new.png", img => {
            this.uiImage = img;
            this.imageWidth = img.width;
            this.imageHeight = img.height;
            this.x = p.width / 2 - this.imageWidth / 2;
            this.y = 500;
        });

        var imageSrc = "res/images/ui/subtitle_bar_new.png";

        const onSuccess = (image: p5.Image) => {
            //console.log("debug 성공", { imageSrc });
            console.log("이미지 로드 성공 : " + imageSrc);

            this.uiImage = image;
            this.imageWidth = image.width;
            this.imageHeight = image.height;
            this.x = p.width / 2 - this.imageWidth / 2;
            this.y = 500;
        };
        let retryCount = 0;
        const maxRetries = 10;

        const onFail = () => {
            if (retryCount < maxRetries) {
                retryCount++;
                p.loadImage(imageSrc, onSuccess, onFail);
            } else {
                console.error(`Failed to load image after ${maxRetries} attempts.`);
            }
        };

        p.loadImage(imageSrc, onSuccess, onFail);
    }

    private drawDialogBox(): void {
        const msg = this.current.text;
        if (!msg) {
            return;
        }

        p.push();
        p.tint(255, 190);

        if (this.uiImage == null) {
            return;
        }

        p.image(this.uiImage, this.x, this.y, this.imageWidth, this.imageHeight);
        p.pop();
    }

    private drawText(): void {
        if (this.current.teller) {
            p.push();
            p.fill(0, 0, 0);
            p.textAlign(p.CENTER, p.CENTER);
            p.textSize(TELLER_TEXT_SIZE);
            p.text(this.current.teller, this.x + this.imageWidth / 2, this.y + 50);
            p.pop();
        }

        p.fill(0, 0, 0);
        const msg = this.current.text.replace("\\n", "\n");
        if (this.frameElapsed >= this.frameCounterTime && this.charIndex < msg.length) {
            this.charIndex++;
        } else if (this.charIndex >= msg.length) {
            this.charIndex = msg.length;
        }

        const showingText = msg.substring(0, this.charIndex);
        p.textSize(MSG_TEXT_SIZE);
        p.text(showingText, this.x + 130, this.y + 75, this.imageWidth - 250, this.imageHeight - 80);
        this.frameElapsed += deltaTime
    }

    public draw(): void {
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

    public isVisible(): boolean {
        return this.visible;
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

    public next(): boolean {
        const msg = this.current.text.replace("\\n", "\n");
        if (this.charIndex < msg.length) {
            this.charIndex = msg.length;
            return true;
        }

        stopPlayingVoice();

        if (this.queue.length > 0) {
            this.resetTextAnimation();
            this.current = this.queue.shift()!;
            if (this.current.voicePath) {
                //lastPlayedSoundFile = soundManager.playOnce(this.current.voicePath);
            }
            return true;
        }

        return false;
    }

    private resetTextAnimation(): void {
        this.frameElapsed = 0;
        this.charIndex = 0;
    }

    public push(msg: string, teller: string): void {
        this.resetTextAnimation();
        this.queue.push(new DialogContent("0", msg, teller, undefined));
    }

    public getCurrentId(): string {
        return this.current.id;
    }
}

//let lastPlayedSoundFile: SoundFile | null = null;

export function stopPlayingVoice(): void {
    //if (lastPlayedSoundFile === null) return;

    //lastPlayedSoundFile.stop();
    //lastPlayedSoundFile.removeFromCache();
    //lastPlayedSoundFile = null;
}