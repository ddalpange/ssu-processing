Button[] createGridButtons(String[] buttonTexts, int fontSize, int columnCount, int x, int y, int w, int h, color buttonColor) {
  Button[] buttons = new Button[buttonTexts.length];
  int buttonIndex = 0;
  int eachButtonWidth = w / columnCount;
  int rowCount = (int)Math.ceil((float)buttonTexts.length / columnCount);
  int eachButtonHeight = h / rowCount;
  int currentX = x;
  for (int i = 0; i < rowCount; i++) {
    for (int j = 0; j < columnCount; j++) {
      if (buttonIndex < buttonTexts.length) {
        var button = new Button();
        button.text = buttonTexts[buttonIndex];
        button.position = new PVector(currentX, y);
        button.size = new PVector(eachButtonWidth, eachButtonHeight);
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

  for (Button b : buttons) {
    if (b == null) {
      throw new RuntimeException("Button is null");
    }
  }
  return buttons;
}

// void drawGridButtons(int count, int columnCount, int rowCount, int x, int y, int w, int h) {
//     int buttonIndex = 0;
//     for (int i = 0; i < rowCount; i++) {
//         for (int j = 0; j < columnCount; j++) {
//             if (buttonIndex < count) {
//                 buttons[buttonIndex].draw(x, y, w, h);
//                 buttonIndex++;
//             }
//             x += w;
//         }
//         x = 0;
//         y += h;
//     }
// }