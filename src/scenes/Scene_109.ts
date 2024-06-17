import { BaseScene } from "../interfaces/BaseScene";
import { Drawable } from "../interfaces/Drawable";
import { CharacterPoseType, CharacterType, loadBackground, objectFactory } from "../interfaces/Objects";
import { PVector } from "../interfaces/PVector";
import { ShapeObject } from "../interfaces/ShapeObject";

let REDBEAN_ITEM_COUNT: number;
let REDBEAN_RICECAKE_COUNT: number;
let TIGER_MOUSE_X: number;
let TIGER_MOUSE_Y: number;
let TIGER_MOUSE_SIZE: number;

export class Scene_109 extends BaseScene {
    private tiger!: ShapeObject;
    private target!: ShapeObject;
    private basket1!: Drawable;
    private basket2!: Drawable;
    private items!: Item[];
    private selected?: Item | null;
    private redbeanRicecakeCount!: ShapeObject[];

    private BASTKET_X!: number;
    private BASTKET_Y!: number;
    private BASTKET_WIDTH!: number;
    private BASTKET_HEIGTH!: number;

    getPreviousScene(): number {
        return 108;
    }

    getNextScene(): number {
        return 110;
    }

    setup() {
        this.uiManager.dialogUi.enqueueAll(this.uiManager.getDialogForScene(this));
        this.uiManager.dialogUi.next();


        loadBackground("10-1", this.drawManager);

        REDBEAN_ITEM_COUNT = 10;
        REDBEAN_RICECAKE_COUNT = 5;
        TIGER_MOUSE_X = p.width / 2 - 30;
        TIGER_MOUSE_Y = 240;
        TIGER_MOUSE_SIZE = 80;

        this.BASTKET_X = 30;
        this.BASTKET_Y = p.height - 340;
        this.BASTKET_WIDTH = 500;
        this.BASTKET_HEIGTH = 230;

        this.tiger = objectFactory.createCombination(CharacterType.tiger, CharacterPoseType.front);
        this.tiger.setPosition(p.width / 2, p.height - 250);
        this.tiger.setScale(0.7, 0.7);
        this.drawManager.addDrawable(this.tiger);

        loadBackground("10-2", this.drawManager);

        this.target = objectFactory.create("res/images/ui/target.png");
        this.target.setPosition(TIGER_MOUSE_X, TIGER_MOUSE_Y);
        this.target.setScale(0.5, 0.5);
        this.drawManager.addDrawable(this.target);

        this.redbeanRicecakeCount = [];
        this.items = [];

        this.initializeRedbeanRicecakeCount();
        this.initializeItems();

        this.basket2 = objectFactory.create("res/images/object/basket_01_03.png");
        this.basket2.setPosition(250, p.height - 180);
        this.basket2.setScale(1, 2.7);
        this.basket2.zIndex = 1;

        this.basket1 = objectFactory.create("res/images/object/basket_01_02.png");
        this.basket1.setPosition(250, p.height - 100);
        this.basket1.setScale(1, 1);
        this.basket1.zIndex = 3;
    }

    private initializeRedbeanRicecakeCount() {
        for (let i = 0; i < REDBEAN_RICECAKE_COUNT; i++) {
            const redbeanRicecake = objectFactory.create("res/images/object/ricecake_02_01.png");
            redbeanRicecake.setPosition(p.width / 2 + 300 + i * 70, 50);
            this.redbeanRicecakeCount.push(redbeanRicecake);
        }
    }

    private initializeItems() {
        for (let i = 0; i < REDBEAN_RICECAKE_COUNT; i++) {
            this.initializeItem("ricecake_02_01", null);
        }
        for (let i = REDBEAN_RICECAKE_COUNT; i < REDBEAN_ITEM_COUNT; i++) {
            // TODO: 이거 맞나? 랜덤
            const randomItem = Math.round(p.random(2)) == 1
            this.initializeItem(randomItem ? "egg" : "ricecake_01_01", null);
        }
    }

    private initializeItem(type: string, position: PVector | null) {
        if (position === null) {
            position = this.randomPosition(this.items, null);
        }
        const item = new Item(type, position);
        this.items.push(item);
    }

    private randomPosition(existingItems: Item[], currentItem: Item | null): PVector {
        let position: PVector;
        const itemWidth = currentItem !== null ? currentItem.getW() : 50;
        const itemHeight = currentItem !== null ? currentItem.getH() : 50;
        const maxAttempts = 100;
        let attempts = 0;
        let validPositionFound = false;

        do {
            const randomX = Math.round(p.random(this.BASTKET_WIDTH - itemWidth)) +
                this.BASTKET_X + itemWidth / 2;
            const randomY = Math.round(p.random(this.BASTKET_HEIGTH - itemHeight)) + this.BASTKET_Y + itemHeight / 2;
            position = new PVector(randomX, randomY);
            attempts++;
            if (attempts >= maxAttempts) {
                break;
            }
            validPositionFound = !this.isOverlappingWithOtherItems(existingItems, position, currentItem) &&
                !this.isOutsideBasketBounds(position, itemWidth, itemHeight);
        } while (!validPositionFound);

        if (!validPositionFound) {
            position = new PVector(this.BASTKET_X + this.BASTKET_WIDTH / 2, this.BASTKET_Y + this.BASTKET_HEIGTH / 2);
        }

        return position;
    }

    private isOverlappingWithOtherItems(existingItems: Item[], position: PVector, currentItem: Item | null): boolean {
        for (const item of existingItems) {
            if (item !== currentItem && p.dist(position.x, position.y, item.getX(), item.getY()) < Math.max(item.getW(), item.getH())) {
                return true;
            }
        }
        return false;
    }

    private isOutsideBasketBounds(position: PVector, itemWidth: number, itemHeight: number): boolean {
        return (position.x - itemWidth / 2 + 6 < this.BASTKET_X ||
            position.x + itemWidth / 2 + 6 > this.BASTKET_X + this.BASTKET_WIDTH ||
            position.y - itemHeight / 2 + 6 < this.BASTKET_Y ||
            position.y + itemHeight / 2 + 6 > this.BASTKET_HEIGTH);
    }

    private isGameComplete(): boolean {
        for (const item of this.items) {
            if (item.getItemObjectType() === "ricecake_02_01") {
                return false;
            }
        }
        return true;
    }

    draw() {
        if (p.keyIsPressed && p.keyCode === 38) {
            this.loadNextScene();
            return;
        }

        p.push();
        p.background(255);

        this.drawManager.drawing();

        this.basket2.draw();
        for (const item of this.items) {
            item.draw();
            if (!item.isMoving && !item.isDragging)
                item.updateHover();
        }
        this.basket1.draw();

        for (const redbeanRicecake of this.redbeanRicecakeCount) {
            redbeanRicecake.draw();
        }

        const iterator = this.items[Symbol.iterator]();
        let result = iterator.next();
        while (!result.done) {
            const item = result.value;
            if (item.isAtTarget() && item.getItemObjectType() === "ricecake_02_01") {
                this.items = this.items.filter(i => i !== item);
                this.redbeanRicecakeCount.shift();

                const isComplete = this.isGameComplete();
                if (isComplete) {
                    this.loadNextScene();
                }
            } else if ((item.isAtBasket() || item.isCanvasOut()) && item.getItemObjectType() === "ricecake_02_01") {
                const position = this.randomPosition(this.items, item);
                item.initItem(position);
                this.selected = null;
            } else if (item.isAtTarget() || item.isAtBasket() || item.isCanvasOut()) {
                const position = this.randomPosition(this.items, item);
                item.initItem(position);
                this.selected = null;
            }
            result = iterator.next();
        }

        this.uiManager.drawing();

        p.pop();
    }

    mousePressed() {
        if (this.uiManager.dialogUi.next()) {
            return;
        } else if (this.uiManager.dialogUi.visible) {
            this.uiManager.dialogUi.hide();
        }

        for (const item of this.items) {
            if (item.mousePressed()) {
                const w = item.getW();
                if (p.mouseX < p.width / 2 + w / 2 && p.mouseX > p.width / 2 - w / 2) {
                    item.onClick();
                } else {
                    if (this.selected !== null) {
                        const position = this.randomPosition(this.items, item);
                        this.selected?.initItem(position);
                        this.selected = null;
                    }
                    this.selected = item;
                    item.setPosition(new PVector(p.width / 2, p.height - 100));
                }
                break;
            }
        }
    }

    mouseReleased() {
        for (const item of this.items) {
            item.mouseReleased();
        }
    }
}

class Item {
    private itemObject?: ShapeObject | null;
    private dragStartX!: number;
    private dragStartY!: number;
    private dragEndX!: number;
    private dragEndY!: number;
    private dragStartTime!: number;
    private dragEndTime!: number;
    private xSpeed!: number;
    private ySpeed!: number;
    private gravity: number = 0.5;
    public isMoving: boolean = false;
    public isDragging: boolean = false;
    private itemObjectType: string;

    constructor(type: string, position: PVector) {
        this.itemObjectType = type;
        this.itemObject = objectFactory.create(`res/images/object/${type}.png`);
        this.initItem(position);
    }

    initItem(position: PVector) {
        let item = this.itemObject!;

        switch (this.itemObjectType) {
            case "ricecake_02_01":
                item.setPosition(position.x - 25, position.y - 25);
                item.w = 50;
                item.h = 50;
                item.setScale(1, 1);
                break;
            case "ricecake_01_01":
                item.setPosition(position.x, position.y);
                item.w = 50;
                item.h = 30;
                item.setScale(1.5, 1.5);
                break;
            case "egg":
                item.setPosition(position.x, position.y);
                item.w = 50;
                item.h = 70;
                item.setScale(0.7, 0.7);
                break;
            default:
                this.itemObject = null;
                break;
        }

        if (this.itemObject !== null) {
            this.itemObject!.zIndex = 2;
        }
    }

    getItemObject(): Drawable {
        return this.itemObject!;
    }

    getItemObjectType(): string {
        return this.itemObjectType;
    }

    getX(): number {
        return this.itemObject!.x;
    }

    getY(): number {
        return this.itemObject!.y;
    }

    getW(): number {
        return this.itemObject!.w;
    }

    getH(): number {
        return this.itemObject!.h;
    }

    setPosition(position: PVector) {
        this.itemObject!.setPosition(position.x, position.y);
    }

    setScale(x: number, y: number) {
        this.itemObject!.setScale(x, y);
    }

    isAtTarget(): boolean {
        return this.itemObject!.x - this.itemObject!.w / 2 > TIGER_MOUSE_X - TIGER_MOUSE_SIZE / 2 &&
            this.itemObject!.x + this.itemObject!.w / 2 < TIGER_MOUSE_X + TIGER_MOUSE_SIZE / 2 &&
            this.itemObject!.y - this.itemObject!.h / 2 > TIGER_MOUSE_Y - TIGER_MOUSE_SIZE / 2 &&
            this.itemObject!.y + this.itemObject!.h / 2 < TIGER_MOUSE_Y + TIGER_MOUSE_SIZE / 2;
    }

    isAtBasket(): boolean {
        return this.itemObject!.x - this.itemObject!.w / 2 > p.width / 2 - 200 &&
            this.itemObject!.x - this.itemObject!.w / 2 < p.width / 2 - 200 + 370 &&
            this.itemObject!.y - this.itemObject!.h / 2 > 130 &&
            this.itemObject!.y - this.itemObject!.h / 2 < 130 + 120;
    }

    isCanvasOut(): boolean {
        return (this.itemObject!.x - this.itemObject!.w < 0 || this.itemObject!.y - this.itemObject!.h < 0) ||
            (this.itemObject!.x + this.itemObject!.w >= p.width || this.itemObject!.y + this.itemObject!.h / 2 >= p.height);
    }

    draw() {
        if (this.isDragging) {
            this.setPosition(new PVector(p.mouseX, p.mouseY));
        } else if (this.isMoving) {
            const simulatedX = this.itemObject!.x + this.xSpeed;
            const simulatedY = this.itemObject!.y + this.ySpeed;
            this.setPosition(new PVector(simulatedX, simulatedY));

            const isEgg = this.itemObjectType === "egg";
            const sizeFactor = p.map(simulatedY, TIGER_MOUSE_Y, p.height, isEgg ? 0.2 : 0.5, isEgg ? 0.7 : 1.2);
            this.setScale(sizeFactor, sizeFactor);

            this.ySpeed += this.gravity;

            if (this.isAtTarget() || this.isAtBasket() || this.isCanvasOut()) {
                this.isMoving = false;
            }
        }
        this.itemObject!.draw();
    }

    updateHover() {
        this.itemObject!.update();
    }

    onClick() {
        this.dragStartX = p.mouseX;
        this.dragStartY = p.mouseY;
        this.dragStartTime = p.millis();
        this.isDragging = true;
    }

    mousePressed(): boolean {
        return this.itemObject!.isMouseClicked();
    }

    mouseReleased() {
        if (this.isDragging) {
            this.dragEndX = p.mouseX;
            this.dragEndY = p.mouseY;
            this.dragEndTime = p.millis();

            this.xSpeed = (this.dragEndX - this.dragStartX) / ((this.dragEndTime - this.dragStartTime) * 0.05);
            this.ySpeed = (this.dragEndY - this.dragStartY) / ((this.dragEndTime - this.dragStartTime) * 0.05);

            this.setPosition(new PVector(this.dragStartX, this.dragStartY));

            this.isDragging = false;
            this.isMoving = true;
        }
    }
}