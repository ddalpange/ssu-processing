import { allScenes } from "../constants/allScenes";
import { BaseScene } from "../interfaces/BaseScene";
import { CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { sceneManager } from "../interfaces/SceneManager";
import { Button2 } from "../objects/Button2";

export class Scene_217 extends BaseScene {
    private retryButton!: Button2;
    private creditButton!: Button2;

    public getPreviousScene(): number { return 216; }

    public getNextScene(): number { return -1; }

    public setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("32", this.drawManager);

        let girl = objectFactory.createAnimation(CharacterType.girl, "smile", 2)!;
        girl.playInfinite(1);
        girl.setPosition(p.width / 2 + 80, 500);
        girl.setScale(0.6, 0.6);
        this.drawManager.addDrawable(girl);

        let boy = objectFactory.createAnimation(CharacterType.boy, "smile", 2)!;
        boy.playInfinite(1);
        boy.setPosition(p.width / 2 + 450, 500);
        boy.setScale(0.5, 0.5);
        this.drawManager.addDrawable(boy);

        let mom = objectFactory.createAnimation(CharacterType.mom, "smile", 2)!;
        mom.playInfinite(1);
        mom.setPosition(p.width / 2 + 270, 450);
        mom.setScale(1, 1);
        this.drawManager.addDrawable(mom);

        this.retryButton = new Button2("res/images/UI/button_1.png", 1080, 100);
        this.retryButton.text = locale == "en" ? "Want to go back?" : "다시 하시겠습니까?";
        this.retryButton.setScale(1, 1);
        this.drawManager.addDrawable(this.retryButton);

        this.creditButton = new Button2("res/images/UI/button_1.png", 1080, 200);
        this.creditButton.text = locale == "en" ? "Credits" : "제작진";
        this.creditButton.setScale(1, 1);
        this.drawManager.addDrawable(this.creditButton);
    }

    public draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    public mousePressed(): void {
        this.uiManager.dialogUi.next();
        if (this.retryButton.isClicked()) {
            sceneManager.loadScene(allScenes[204](), true);
        }
        if (this.creditButton.isClicked()) {
            //sceneManager.loadScene(new Scene_Ending());
        }
    }
}