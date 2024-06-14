import { BaseScene } from "../interfaces/BaseScene";
import { loadBackground, objectFactory } from "../interfaces/Objects";

export class Scene_307 extends BaseScene {
    getPreviousScene(): number { return 306; }

    getNextScene(): number { return 308; }

    setup(): void {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();

        loadBackground("44", this.drawManager);

        // 회전시키면 마우스 호버랑 위치가 이상해짐;; 일단 패스
        let axe = objectFactory.create("res/images/object/ex.png");
        axe.setPosition(900, 350);
        axe.setScale(0.35, 0.35);
        //axe.d_rotate(30);
        this.drawManager.addDrawable(axe);

        let oil = objectFactory.create("res/images/object/oil.png");
        oil.setPosition(400, 350);
        //oil.d_rotate(30);
        this.drawManager.addDrawable(oil);
    }

    draw(): void {
        p.push();

        this.drawManager.drawing();
        this.uiManager.drawing();

        p.pop();
    }

    mousePressed(): void {
        if (this.uiManager.dialogUi.next()) {
            return;
        }

        this.loadNextScene();
    }
}