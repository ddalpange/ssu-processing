import java.util.*;
import java.awt.Point;

int REDBEAN_ITEM_COUNT;
int REDBEAN_RICECAKE_COUNT;
float TIGER_MOUSE_X;
float TIGER_MOUSE_Y;
float TIGER_MOUSE_SIZE;

public class Scene_109 extends BaseScene {
  @Override
  public int getPreviousScene() { return 108; }

  @Override
  public int getNextScene() { return 110; }

  private Random random;
  private ShapeObject tiger;
  private ShapeObject target;
  private Drawable basket1;
  private Drawable basket2;
  private List<Item> items;
  private Item selected;
  private List<ShapeObject> redbeanRicecakeCount;
  private float elapsedTime = 0;

  private int BASTKET_X;
  private int BASTKET_Y;
  private int BASTKET_WIDTH;
  private int BASTKET_HEIGTH;

  public void setup() {
    uiManager.dialogUi.enqueueAll(uiManager.getDialogForScene(this));
    uiManager.dialogUi.next();
    
    random = new Random();

    loadBackground("10-1", drawManager);
    Scene_108_background_setup(drawManager);

    REDBEAN_ITEM_COUNT = 10;
    REDBEAN_RICECAKE_COUNT = 5;
    TIGER_MOUSE_X = width / 2 - 30;
    TIGER_MOUSE_Y = 240;
    TIGER_MOUSE_SIZE = 80;

    BASTKET_X = 30;
    BASTKET_Y = height - 340;
    BASTKET_WIDTH = 500;
    BASTKET_HEIGTH = 230;

    tiger = objectFactory.create(CharacterType.tiger, CharacterPoseType.front);
    tiger.setPosition(width/2, height-250);
    tiger.setScale(0.7, 0.7);
    drawManager.addDrawable(tiger);

    loadBackground("10-2", drawManager);
    Scene_108_background_setup2(drawManager);

    target = objectFactory.create("res/images/ui/target.png");
    target.setPosition(TIGER_MOUSE_X, TIGER_MOUSE_Y);
    target.setScale(0.5, 0.5);
    drawManager.addDrawable(target);

    redbeanRicecakeCount = new ArrayList<>();
    items = new ArrayList<>();
    
    initializeRedbeanRicecakeCount();
    initializeItems();
    // basket = objectFactory.create(BackgroundType.소쿠리);

    basket2 = objectFactory.create("res/images/object/basket_01_03.png");
    basket2.setPosition(250, height - 180);
    basket2.setScale(1, 2.7);
    basket2.setZIndex(1);
    // drawManager.addDrawable(basket2);
    
    basket1 = objectFactory.create("res/images/object/basket_01_02.png");
    basket1.setPosition(250, height - 100);
    basket1.setScale(1, 1);
    basket1.setZIndex(3);
    // drawManager.addDrawable(basket1);
  }

  private void initializeRedbeanRicecakeCount() {
    for (int i = 0; i < REDBEAN_RICECAKE_COUNT; i++) {
      ShapeObject redbeanRicecake = objectFactory.create("res/images/object/ricecake_02_01.png");
      redbeanRicecake.setPosition(width / 2 + 300 + i * 70, 50);
      redbeanRicecakeCount.add(redbeanRicecake);
    }
  }

  private void initializeItems() {
    for (int i = 0; i < REDBEAN_RICECAKE_COUNT; i++) {
      initializeItem("ricecake_02_01", null);
    }
    for (int i = REDBEAN_RICECAKE_COUNT; i < REDBEAN_ITEM_COUNT; i++) {
      boolean randomItem = random.nextBoolean();
      initializeItem(randomItem ? "egg" : "ricecake_01_01", null);
    }
  }

  private void initializeItem(String type, Point position) {
    if (position == null) {
      position = randomPosition(items, null);
    }
    Item item = new Item(type, position);
    items.add(item);
    // drawManager.addDrawable(item.getItemObject());
  }

  private Point randomPosition(List<Item> existingItems, Item currentItem) {

    Point position;
    float itemWidth = currentItem != null ? currentItem.getW() : 50; 
    float itemHeight = currentItem != null ? currentItem.getH() : 50;
    int maxAttempts = 100;
    int attempts = 0;
    boolean validPositionFound = false;

    do {
        int randomX = random.nextInt(BASTKET_WIDTH - (int)itemWidth) + BASTKET_X + (int)itemWidth / 2;
        int randomY = random.nextInt(BASTKET_HEIGTH - (int)itemHeight) + BASTKET_Y + (int)itemHeight / 2;
        position = new Point(randomX, randomY);
        attempts++;
        if (attempts >= maxAttempts) {
            break;
        }
        validPositionFound = !isOverlappingWithOtherItems(existingItems, position, currentItem) &&
                             !isOutsideBasketBounds(position, itemWidth, itemHeight);
        
    } while (!validPositionFound);
    
    if (!validPositionFound) {
        position = new Point(BASTKET_X + BASTKET_WIDTH / 2, BASTKET_Y + BASTKET_HEIGTH / 2);
    }

    return position;
  }


  private boolean isOverlappingWithOtherItems(List<Item> existingItems, Point position, Item currentItem) {
    for (Item item : existingItems) {
      if (item != currentItem && dist(position.x, position.y, item.getX(), item.getY()) < Math.max(item.getW(), item.getH())) {
          return true;
      }
    }
    return false;
  }
  
private boolean isOutsideBasketBounds(Point position, float itemWidth, float itemHeight) {
    return (position.x - itemWidth / 2 + 6 < BASTKET_X || 
            position.x + itemWidth / 2 + 6 > BASTKET_X + BASTKET_WIDTH || 
            position.y - itemHeight / 2 + 6< BASTKET_Y || 
            position.y + itemHeight / 2 + 6 > BASTKET_Y + BASTKET_HEIGTH);
}


  private boolean isGameComplete() {
    for (Item item : items) {
      if (item.getItemObjectType() == "ricecake_02_01") {
        return false;
      }
    }

    return true;
  }
  
  public void draw() {
    // test: up 키로 씬 넘어가기
    if (keyPressed && keyCode == 38) {
      loadNextScene();
      return;
    }

    elapsedTime += deltaTime;

    pushStyle();
    background(255);

    drawManager.drawing();

    basket2.draw();
    for (Item item : items) {
      item.draw();
      if (!item.isMoving && !item.isDragging)
      item.updateHover();
    }
    basket1.draw();

    for (ShapeObject redbeanRicecake : redbeanRicecakeCount) {
      redbeanRicecake.draw();
    }

    // noFill();
    // rect(BASTKET_X, BASTKET_Y, BASTKET_WIDTH, BASTKET_HEIGTH);
    // rect(width / 2 - 220, 130, 370, 120);

    Iterator<Item> iterator = items.iterator();
    while (iterator.hasNext()) {
      Item item = iterator.next();
      if (item.isAtTarget() && item.getItemObjectType() == "ricecake_02_01") {
        iterator.remove();
        redbeanRicecakeCount.remove(0);

        boolean isComplete = isGameComplete();
        if (isComplete) {
          loadNextScene();
        }
      } else if ((item.isAtBasket() || item.isCanvasOut()) && item.getItemObjectType() == "ricecake_02_01") {
        Point position = randomPosition(items, item);
        item.initItem(position); 
        selected = null;
      } else if (item.isAtTarget() ||item.isAtBasket() || item.isCanvasOut()) {
        Point position = randomPosition(items, item);
        item.initItem(position); 
        selected = null;
      } 
    }

    uiManager.drawing();
    
    popStyle();
  }

  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    } else if (uiManager.dialogUi.isVisible()) {
      uiManager.dialogUi.hide();
    }

    for (Item item : items) {
      if (item.mousePressed()) {
        float w = item.getW();
        if (mouseX < width / 2 + w / 2 && mouseX > width / 2 - w / 2) {
          item.onClick();
        } else {
          if (selected != null) {
            Point position = randomPosition(items, item);
            selected.initItem(position); 
            selected = null;
          }
          selected = item;
          item.setPosition(new Point(width / 2, height - 100));
        }
        break;
      }
    }
  }

  public void mouseReleased() {
    for (Item item : items) {
      item.mouseReleased();
    }
  }
}

public class Item {
  private ShapeObject itemObject;

  private float dragStartX, dragStartY;
  private float dragEndX, dragEndY;
  private float dragStartTime, dragEndTime;
  private float xSpeed, ySpeed;
  private float gravity = 0.5;

  private boolean isMoving = false;
  private boolean isDragging = false;

  String itemObjectType;

  public Item(String type, Point position) {
    itemObjectType = type;
    itemObject = objectFactory.create("res/images/object/" + type + ".png");
    initItem(position);
  }

  public void initItem(Point position) {
    switch (itemObjectType) {
      case "ricecake_02_01":
        itemObject.setPosition(position.x - 25, position.y - 25);
        itemObject.w = 50;
        itemObject.h = 50;
        itemObject.setScale(1, 1);
        break;
      case "ricecake_01_01":
        itemObject.setPosition(position.x, position.y);
        itemObject.w = 50;
        itemObject.h = 30;
        itemObject.setScale(1.5, 1.5);
        break;
      case "egg":
        itemObject.setPosition(position.x, position.y);
        itemObject.w = 50;
        itemObject.h = 70;
        itemObject.setScale(0.7, 0.7);
        break;
      default:
        itemObject = null;
        break;
    }
    itemObject.setZIndex(2);
  }

  public Drawable getItemObject() {
    return itemObject;
  }

  public String getItemObjectType() {
    return itemObjectType;
  }

  public float getX() {
    return itemObject.x;
  }

  public float getY() {
    return itemObject.y;
  }

  public float getW() {
    return itemObject.w;
  }

  public float getH() {
    return itemObject.h;
  }

  public void setPosition(Point position) {
    itemObject.setPosition(position.x, position.y);
  }

  public void setScale(float x, float y) {
    itemObject.setScale(x, y);
  }

  public boolean isAtTarget() {
    return itemObject.x - itemObject.w / 2 > TIGER_MOUSE_X - TIGER_MOUSE_SIZE / 2 &&
           itemObject.x + itemObject.w / 2 < TIGER_MOUSE_X + TIGER_MOUSE_SIZE / 2 &&
           itemObject.y - itemObject.h / 2 > TIGER_MOUSE_Y - TIGER_MOUSE_SIZE / 2 &&
           itemObject.y + itemObject.h / 2 < TIGER_MOUSE_Y + TIGER_MOUSE_SIZE / 2;
  }

  public boolean isAtBasket() {
    return itemObject.x - itemObject.w / 2 > width / 2 - 200 &&
           itemObject.x - itemObject.w / 2 < width / 2 - 200 + 370 &&
           itemObject.y - itemObject.h / 2 > 130 &&
           itemObject.y - itemObject.h / 2 < 130 + 120;
  }

  public boolean isCanvasOut() {
    return (itemObject.x - itemObject.w < 0 || itemObject.y - itemObject.h < 0) ||
           (itemObject.x + itemObject.w >= width || itemObject.y + itemObject.h / 2 >= height);
  }

  public void draw() {
    if (isDragging) {
      // line(dragStartX, dragStartY, mouseX, mouseY); 
      setPosition(new Point((int)mouseX, (int)mouseY));
    } else if (isMoving) {
      float simulatedX = itemObject.x + xSpeed;
      float simulatedY = itemObject.y + ySpeed;
      setPosition(new Point((int)simulatedX, (int)simulatedY));

      boolean isEgg = itemObjectType == "egg" ? true : false;
      float sizeFactor = map(simulatedY, TIGER_MOUSE_Y, height, isEgg ? 0.2 : 0.5, isEgg ? 0.7 : 1.2);
      setScale(sizeFactor, sizeFactor);

      ySpeed += gravity;

      if (isAtTarget() || isAtBasket() || isCanvasOut()) {
        isMoving = false;
      }
    }
    itemObject.draw();
  }

  public void updateHover() {
    itemObject.update();
  }
  
  public void onClick() {
    dragStartX = mouseX;
    dragStartY = mouseY;
    dragStartTime = millis();
    isDragging = true;
  }

  public boolean mousePressed() {
    return itemObject.mousePressed();
  }

  public void mouseReleased() {
    if (isDragging) {
      dragEndX = mouseX;
      dragEndY = mouseY;
      dragEndTime = millis();
      
      xSpeed = (dragEndX - dragStartX) / ((dragEndTime - dragStartTime) * 0.05); 
      ySpeed = (dragEndY - dragStartY) / ((dragEndTime - dragStartTime) * 0.05); 
      
      setPosition(new Point((int)dragStartX, (int)dragStartY));
      
      isDragging = false;
      isMoving = true;
    }
  }
}
