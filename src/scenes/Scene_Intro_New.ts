import { BaseScene } from "../interfaces/BaseScene";
import { ShapeObject } from "../interfaces/ShapeObject";
import { Button2 } from "../objects/Button2";
import { loadBackground, objectFactory } from "../interfaces/Objects";
import { PVector } from "../interfaces/PVector";
import { allSceneNumbers, allScenes } from "../constants/allScenes";
import { Util } from "../interfaces/Util";
import { createGridButtons } from "../interfaces/GridLayout";
import { deploymentSceneNumbers, endingSceneNumbers, introductionSceneNumbers } from "../constants/knownScenes";
import { Button } from "../objects/Button";
import { Scene_101 } from "./Scene_101";
import { sceneManager } from "../interfaces/SceneManager";
import { Scene_Ending } from "./Scene_Ending";

export class Scene_Intro_New extends BaseScene {
    mode: number = 0;

    // 0
    title!: ShapeObject;
    startButton!: Button2;
    sceneListButton!: Button2;
    creditButton!: Button2;
    localeButton!: Button2;

    // 1
    도입버튼!: ShapeObject;
    전개버튼!: ShapeObject;
    결말버튼!: ShapeObject;
    textColor: string = '#7c633e';

    backButton!: Button2;
    sceneButtonWidth: number = 100;

    introductionSceneButtons!: Button[];
    deploymentSceneButtons!: Button[];
    endingSceneButtons!: Button[];

    getPreviousScene(): number {
        return -1;
    }

    getNextScene(): number {
        return -1;
    }

    setup() {
        loadBackground('intro', this.drawManager);

        // 0
        this.title = objectFactory.create('res/images/UI/Opening_TItle.png');
        this.title.setPosition(p.width / 2, 150);
        this.title.setScale(0.7, 0.7);

        const textOffset = new PVector(0, -5);
        this.startButton = new Button2('res/images/UI/intro_button1.png', p.width / 2, 400, 'Start', 30);
        //this.startButton.mouseOverImage = loadImage('res/images/UI/intro_button2.png');
        this.startButton.textOffset = textOffset;
        this.startButton.fontColor = this.textColor;

        this.sceneListButton = new Button2('res/images/UI/intro_button1.png', p.width / 2, 500, 'Shortcuts', 30);
        //this.sceneListButton.mouseOverImage = loadImage('res/images/UI/intro_button2.png');
        this.sceneListButton.textOffset = textOffset;
        this.sceneListButton.fontColor = this.textColor;

        this.creditButton = new Button2('res/images/UI/intro_button1.png', p.width / 2, 600, 'Credits', 30);
        //this.creditButton.mouseOverImage = loadImage('res/images/UI/intro_button2.png');
        this.creditButton.textOffset = textOffset;
        this.creditButton.fontColor = this.textColor;

        this.localeButton = new Button2('res/images/UI/koreng.png', p.width - 150, 200, locale, 20);
        this.localeButton.setScale(0.6, 0.6);
        this.localeButton.textOffset = new PVector(0, -2);
        this.localeButton.fontColor = this.textColor;

        this.refreshButtonText();

        // 1
        this.도입버튼 = objectFactory.create('res/images/UI/Opening_UI_03_01.png');
        this.도입버튼.setPosition(p.width / 3 - 200, 100);

        this.전개버튼 = objectFactory.create('res/images/UI/Opening_UI_03_02.png');
        this.전개버튼.setPosition(p.width / 2, 100);

        this.결말버튼 = objectFactory.create('res/images/UI/Opening_UI_03_03.png');
        this.결말버튼.setPosition(p.width / 3 * 2 + 200, 100);

        this.backButton = new Button2('res/images/UI/button_back.png', 50, 50);

        const transparentColor: string = '#00000000'

        this.introductionSceneButtons = createGridButtons(Util.ToStringArray(introductionSceneNumbers), 20, 1, p.width / 3 - 300, 150, 200, p.height - 170, transparentColor);
        this.deploymentSceneButtons = createGridButtons(Util.ToStringArray(deploymentSceneNumbers), 20, 1, p.width / 2 - 100, 150, 200, p.height - 170, transparentColor);
        this.endingSceneButtons = createGridButtons(Util.ToStringArray(endingSceneNumbers), 20, 1, p.width / 3 * 2 + 100, 150, 200, p.height - 170, transparentColor);
    }

    drawButtonAndGetClicked(button: Button2): boolean {
        button.draw();
        return button.isClicked();
    }

    draw() {
        p.push();

        this.drawManager.drawing();
        if (this.mode === 0) { // Main
            this.title.draw();

            if (this.drawButtonAndGetClicked(this.startButton)) {
                sceneManager.loadScene(new Scene_101());
            }

            if (this.drawButtonAndGetClicked(this.sceneListButton)) {
                this.mode = 1;
            }

            if (this.drawButtonAndGetClicked(this.creditButton)) {
                sceneManager.loadScene(new Scene_Ending());
            }

            if (this.drawButtonAndGetClicked(this.localeButton)) {
                locale = locale === 'en' ? 'ko' : 'en';
                this.refreshButtonText();
            }
        } else if (this.mode === 1) { // Scene List
            this.도입버튼.draw();
            this.전개버튼.draw();
            this.결말버튼.draw();

            if (this.drawButtonAndGetClicked(this.backButton)) {
                this.mode = 0;
            }

            for (let i = 0; i < this.introductionSceneButtons.length; i++) {
                if (this.introductionSceneButtons[i].drawAndCheckClick()) {
                    sceneManager.loadScene(allScenes[introductionSceneNumbers[i]]());
                }
            }

            for (let i = 0; i < this.deploymentSceneButtons.length; i++) {
                if (this.deploymentSceneButtons[i].drawAndCheckClick()) {
                    sceneManager.loadScene(allScenes[deploymentSceneNumbers[i]]());
                }
            }

            for (let i = 0; i < this.endingSceneButtons.length; i++) {
                if (this.endingSceneButtons[i].drawAndCheckClick()) {
                    sceneManager.loadScene(allScenes[endingSceneNumbers[i]]());
                }
            }

            if (this.drawButtonAndGetClicked(this.backButton)) {
                this.mode = 0;
            }
        }

        p.pop();
    }

    refreshButtonText() {
        this.localeButton.text = locale === 'en' ? 'English' : '한국어';
        if (locale === 'en') {
            this.startButton.text = 'Start';
            this.sceneListButton.text = 'Shortcuts';
            this.creditButton.text = 'Credits';
        } else {
            this.startButton.text = '시작';
            this.sceneListButton.text = '바로가기';
            this.creditButton.text = '제작진';
        }
    }

    mousePressed() {
        this.drawManager.mousePressed();
    }
}