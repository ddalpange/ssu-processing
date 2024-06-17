import { BaseScene } from "../interfaces/BaseScene";
import { ShapeObject } from "../interfaces/ShapeObject";
import { ScaleAnimation } from "../interfaces/ScaleAnimation";
import { TimeTracker } from "../interfaces/TimeTracker";
import { CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { SpriteAnimation } from "../interfaces/SpriteAnimation";
import { Button } from "../objects/Button";
import { PVector } from "../interfaces/PVector";
import { fontManager } from "../interfaces/FontManager";

export class Scene_303 extends BaseScene {
    private GOAL_IN_HEIGHT = -192;
    private GO_UP_SPEED = 24;

    private START_COUNTDOWN_TIME = 3000; // 3 seconds
    private GAME_COUNTDOWN_TIME = 20000; // 20 seconds

    private boyX!: number;
    private girlX!: number;
    private boyAndGirlHeight!: number;

    private startTimeLeft!: number;
    private gameTimeLeft!: number;
    private startTime!: number;

    private isGameStart!: boolean;
    private isDialogVisible!: boolean;

    private boy!: SpriteAnimation;
    private girl!: SpriteAnimation;

    private skipButton!: Button;
    private retryButton!: Button;

    private space!: ShapeObject;
    private spaceUpAnimation!: ScaleAnimation;
    private spaceDownAnimation!: ScaleAnimation;

    private spaceScale = 0.6;
    private spaceScaleDuration = 0.4;

    private curCount = 0;
    private timeTracker = new TimeTracker();

    getPreviousScene() { return 302; }

    getNextScene() { return 304; }

    setup() {
        this.boyX = p.width / 2 - 140;
        this.girlX = p.width / 2 + 110;
        this.boyAndGirlHeight = p.height;

        this.startTimeLeft = this.START_COUNTDOWN_TIME / 1000;
        this.gameTimeLeft = this.GAME_COUNTDOWN_TIME / 1000;
        this.startTime = 0;

        this.isGameStart = false;
        this.isDialogVisible = false;
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.isDialogVisible = this.uiManager.dialogUi.next();

        loadBackground("40", this.drawManager);

        this.boy = this.createCharacter(CharacterType.boy, this.boyX);
        this.girl = this.createCharacter(CharacterType.girl, this.girlX);

        this.retryButton = this.createButton(locale === "en" ? "retry?" : "다시 시도?", p.width / 2 - 150, p.height / 2 - 150);
        this.skipButton = this.createButton(locale === "en" ? "skip?" : "건너뛰기?", p.width / 2 - 150, p.height / 2 + 50);

        this.space = objectFactory.create("res/images/ui/space.png");

        this.spaceUpAnimation = new ScaleAnimation(this.space, this.spaceScale + this.spaceScale * 0.05, this.spaceScale + this.spaceScale * 0.05, this.spaceScaleDuration);
        this.spaceDownAnimation = new ScaleAnimation(this.space, this.spaceScale - this.spaceScale * 0.05, this.spaceScale - this.spaceScale * 0.05, this.spaceScaleDuration);
    }

    draw() {
        p.background(255);

        this.drawManager.drawing();
        this.uiManager.drawing();
        this.timeTracker.update(deltaTime);
        this.animationManager.update();

        this.drawCountdown();
        this.drawGameOver();

        this.updateScale();
    }

    private createCharacter(type: CharacterType, xPosition: number): SpriteAnimation {
        let character = objectFactory.createAnimation(type, "climb", 2)!;
        character.manualMode = true;
        character.setPosition(xPosition, this.boyAndGirlHeight);
        character.setScale(0.55, 0.55);
        this.drawManager.addDrawable(character);

        return character;
    }

    private createButton(text: string, x: number, y: number): Button {
        let button = new Button();
        button.text = text;
        button.position = new PVector(x, y);
        button.size = new PVector(300, 100);
        return button;
    }

    private updateScale() {
        if (this.timeTracker.ifTimeOver(this.curCount * this.spaceScaleDuration)) {
            this.clearAnimation();
            let isEven = this.curCount % 2 === 0;
            this.startAnimation(isEven ? this.spaceUpAnimation.reset() : this.spaceDownAnimation.reset());
            this.curCount++;
        }
    }

    private initGame() {
        this.isGameStart = false;
        this.boyAndGirlHeight = p.height;
        this.boy.setPosition(this.boyX, this.boyAndGirlHeight);
        this.girl.setPosition(this.girlX, this.boyAndGirlHeight);
        this.startTimeLeft = this.START_COUNTDOWN_TIME / 1000;
        this.gameTimeLeft = this.GAME_COUNTDOWN_TIME / 1000;

        this.startTime = p.millis();
    }

    private drawGameOver() {
        if (this.isGameOver()) {
            if (this.retryButton.drawAndCheckClick()) {
                this.initGame();
            }
            if (this.skipButton.drawAndCheckClick()) {
                this.loadNextScene();
            }
        }
    }

    private drawCountdown() {
        if (!this.isDialogVisible && !this.isGameOver()) {
            this.startTimeLeft = this.setCountdown(this.START_COUNTDOWN_TIME);

            if (!this.isGameStart && this.startTimeLeft > 0) {
                fontManager.drawText(
                    this.startTimeLeft.toString(),
                    p.width / 2 - 50,
                    p.height / 2 - 50,
                    p.width / 2 + 50,
                    p.height / 2 + 50,
                    100
                );
            } else if (!this.isGameStart && this.startTimeLeft === 0) {
                fontManager.drawText(
                    locale === "en" ? "START!" : "시작!",
                    p.width / 2 - 200,
                    p.height / 2 - 50,
                    p.width / 2 + 100,
                    p.height / 2 + 50,
                    100
                );
            } else if (!this.isGameStart) {
                this.startTime = p.millis();
                this.isGameStart = true;
            }

            if (this.isGameStart) {
                this.gameTimeLeft = this.setCountdown(this.GAME_COUNTDOWN_TIME);
            }
            p.textAlign(p.RIGHT);
            fontManager.drawText(
                this.gameTimeLeft.toString(),
                p.width / 2 - 130,
                30,
                p.width / 2 + 100,
                200,
                50
            );
        }
    }

    private isGameOver(): boolean {
        return this.isGameStart && this.gameTimeLeft <= 0;
    }

    private setCountdown(countdownTime: number): number {
        let timeElapsed = p.millis() - this.startTime;
        let timeLeft = (countdownTime - timeElapsed) / 1000;

        return timeLeft + 1;
    }

    private setGoUp() {
        this.boyAndGirlHeight -= this.GO_UP_SPEED;

        this.boy.setPosition(this.boyX, this.boyAndGirlHeight);
        this.girl.setPosition(this.girlX, this.boyAndGirlHeight);
        this.boy.nextFrame();
        this.girl.nextFrame();

        if (this.boyAndGirlHeight <= this.GOAL_IN_HEIGHT) {
            this.loadNextScene();
        }
    }

    mousePressed() {
        this.isDialogVisible = this.uiManager.dialogUi.next();

        if (this.startTime === 0 && !this.isDialogVisible) {
            this.uiManager.dialogUi.hide();
            this.startTime = p.millis();
        }
    }

    keyPressed() {
        const spacebar = 32;
        if (this.isGameStart && !this.isGameOver() && p.keyCode === spacebar) {
            //soundManager.playOnce("res/sound/effect/303.308_미니게임클릭소리.mp3");
            this.setGoUp();
        }
    }
}
