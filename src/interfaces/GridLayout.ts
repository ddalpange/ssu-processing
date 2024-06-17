import { Button } from "../objects/Button";
import { PVector } from "./PVector";

export function createGridButtons(buttonTexts: string[], fontSize: number, columnCount: number, x: number, y: number, w: number, h: number, buttonColor: string): Button[] {
    let buttons: Button[] = new Array(buttonTexts.length);
    let buttonIndex = 0;
    let eachButtonWidth = w / columnCount;
    let rowCount = Math.ceil(buttonTexts.length / columnCount);
    let eachButtonHeight = h / rowCount;
    let currentX = x;
    for (let i = 0; i < rowCount; i++) {
        for (let j = 0; j < columnCount; j++) {
            if (buttonIndex < buttonTexts.length) {
                let button: Button = new Button(
                    buttonTexts[buttonIndex], // text
                    new PVector(currentX, y), // position
                    new PVector(eachButtonWidth, eachButtonHeight), // size
                );
                button.fontSize = fontSize;
                button.buttonColor = buttonColor;
                buttons[buttonIndex] = button;
                buttonIndex++;
            }
            currentX += eachButtonWidth;
        }
        currentX = x;
        y += eachButtonHeight;
    }

    for (let b of buttons) {
        if (b == null) {
            throw new Error("Button is null");
        }
    }
    return buttons;
}