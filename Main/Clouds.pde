public class Cloud_Normal extends Drawable {

  public Cloud_Normal(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    fill(#7ac2bc);
    noStroke();
    ellipse(abstractX + 119.6, abstractY + 227.9, 191.9, 194.7);
    ellipse(abstractX + 236.5, abstractY + 151.5, 192.9, 169.4);
    ellipse(abstractX + 349.1, abstractY + 201.5, 177.0, 158.5);
    ellipse(abstractX + 388.6, abstractY + 269.0, 202.4, 137.5);
    rect(abstractX + 105.0, abstractY + 226.0, 258.0, 111.0);
    triangle(abstractX + 201, abstractY + 333, abstractX + 613, abstractY + 344, abstractX + 448, abstractY + 281);

    //back2
    fill(#91D1CD);
    noStroke();
    ellipse(abstractX + 125.6, abstractY + 235.6, 187.9, 194.8);
    ellipse(abstractX + 234.9, abstractY + 160.9, 176.3, 167.8);
    ellipse(abstractX + 349.1, abstractY + 208.6, 164.0, 156.5);
    ellipse(abstractX + 382.5, abstractY + 269.5, 197.3, 127.3);
    rect(abstractX + 105.0, abstractY + 226.0, 258.0, 82.6);
    triangle(abstractX + 201, abstractY + 335, abstractX + 598, abstractY + 345, abstractX + 401, abstractY + 273);

    //front
    fill(#d4f2f0);
    noStroke();
    ellipse(abstractX + 112.6, abstractY + 260.5, 148.4, 153.7);
    ellipse(abstractX + 236.5, abstractY + 231.1, 202.2, 195.5);
    ellipse(abstractX + 352.0, abstractY + 245.6, 121.0, 121.0);
    ellipse(abstractX + 388.6, abstractY + 287.9, 107.5, 99.7);
    rect(abstractX + 105.0, abstractY + 226.0, 258.0, 111.0);
    triangle(abstractX + 201, abstractY + 335, abstractX + 513, abstractY + 341, abstractX + 311, abstractY + 268);

    //front2
    fill(#C0E5E3);
    noStroke();
    ellipse(abstractX + 124.0, abstractY + 270.0, 155.0, 148.8);
    ellipse(abstractX + 236.2, abstractY + 215.6, 170.3, 146.6);
    ellipse(abstractX + 346.3, abstractY + 268.2, 127.6, 148.8);
    ellipse(abstractX + 358.6, abstractY + 288.5, 152.8, 109.9);
    rect(abstractX + 105.0, abstractY + 246.0, 241.1, 95.7);
    triangle(abstractX + 201, abstractY + 341, abstractX + 498, abstractY + 342, abstractX + 276, abstractY + 266);
  }
}

public class Cloud_Small extends Drawable {

  public Cloud_Small(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    //back
    fill(#7ac2bc);
    noStroke();
    ellipse(abstractX + 138.2, abstractY + 257.6, 140, 140);
    ellipse(abstractX + 234.8, abstractY + 205.0, 140, 120);
    ellipse(abstractX + 326.3, abstractY + 231.3, 113, 100);
    ellipse(abstractX + 366.3, abstractY + 280.7, 140, 109);
    rect(abstractX + 105.0, abstractY + 226.0, 129, 55);
    triangle(abstractX + 201, abstractY + 333, abstractX + 613, abstractY + 354, abstractX + 373, abstractY + 281);

    //back2
    fill(#91D1CD);
    noStroke();
    ellipse(abstractX + 140.3, abstractY + 259.6, 130, 130);
    ellipse(abstractX + 234.4, abstractY + 209.1, 130, 110);
    ellipse(abstractX + 323.0, abstractY + 238.2, 110, 100);
    ellipse(abstractX + 362.0, abstractY + 283.6, 130, 103);
    rect(abstractX + 105.0, abstractY + 226.0, 129, 41.3);
    triangle(abstractX + 201, abstractY + 335, abstractX + 598, abstractY + 353, abstractX + 314, abstractY + 273);

    //front
    fill(#d4f2f0);
    noStroke();
    ellipse(abstractX + 148.9, abstractY + 279.4, 120, 121);
    ellipse(abstractX + 237.9, abstractY + 253.5, 140, 140);
    ellipse(abstractX + 323.7, abstractY + 262.8, 90, 90);
    ellipse(abstractX + 369.4, abstractY + 294.0, 82, 83);
    rect(abstractX + 132.5, abstractY + 226.0, 129, 55);
    triangle(abstractX + 201, abstractY + 335, abstractX + 513, abstractY + 350, abstractX + 262, abstractY + 268);

    //front2
    fill(#C0E5E3);
    noStroke();
    ellipse(abstractX + 156.3, abstractY + 286.2, 125, 120);
    ellipse(abstractX + 238.1, abstractY + 251.3, 130, 110);
    ellipse(abstractX + 319.9, abstractY + 280.3, 95, 110);
    ellipse(abstractX + 345.3, abstractY + 296.3, 120, 85);
    rect(abstractX + 138.7, abstractY + 266.4, 120.5, 47.8);
    triangle(abstractX + 164, abstractY + 344, abstractX + 498, abstractY + 349, abstractX + 210, abstractY + 266);
  }
}

public class Cloud_VerySmall extends Drawable {

  public Cloud_VerySmall(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    //back
    fill(#7ac2bc);
    noStroke();
    ellipse(abstractX + 57, abstractY + 132, 138.0, 127.1);
    ellipse(abstractX + 124.1, abstractY + 92.7, 128.6, 112.9);
    ellipse(abstractX + 195, abstractY + 114.1, 118.0, 105.9);
    ellipse(abstractX + 224.3, abstractY + 150.8, 135.4, 91.7);
    rect(abstractX + 52.5, abstractY + 113, 193.5, 83.4);
    triangle(abstractX + 209, abstractY + 195, abstractX + 371, abstractY + 201, abstractX + 224, abstractY + 141);

    //back2
    fill(#91D1CD);
    noStroke();
    ellipse(abstractX + 58, abstractY + 136.6, 125.9, 117.0);
    ellipse(abstractX + 124.8, abstractY + 99.8, 118.2, 111.5);
    ellipse(abstractX + 190, abstractY + 121.0, 109.4, 104.5);
    ellipse(abstractX + 223.2, abstractY + 151.0, 123.8, 84.9);
    rect(abstractX + 52.5, abstractY + 113, 193.5, 69.2);
    triangle(abstractX + 360, abstractY + 201, abstractX + 78, abstractY + 195, abstractX + 174, abstractY + 143);

    //front
    fill(#d4f2f0);
    noStroke();
    ellipse(abstractX + 55.1, abstractY + 148.3, 99.0, 102.5);
    ellipse(abstractX + 124.8, abstractY + 133.3, 118.9, 120.8);
    ellipse(abstractX + 184.1, abstractY + 136.3, 80.3, 80.3);
    ellipse(abstractX + 219.7, abstractY + 161.1, 76.0, 77.5);
    rect(abstractX + 52.5, abstractY + 113, 159.7, 83.4);
    triangle(abstractX + 312, abstractY + 201, abstractX + 161, abstractY + 192, abstractX + 123, abstractY + 130);

    //front2
    fill(#C0E5E3);
    noStroke();
    ellipse(abstractX + 65.4, abstractY + 151.0, 102.1, 94.9);
    ellipse(abstractX + 122.9, abstractY + 115.4, 90.6, 69.3);
    ellipse(abstractX + 178.2, abstractY + 137.3, 81.6, 68.2);
    ellipse(abstractX + 220.9, abstractY + 162.2, 59.0, 68.9);
    rect(abstractX + 62.0, abstractY + 126.7, 154.5, 71.8);
    triangle(abstractX + 297, abstractY + 199, abstractX + 198, abstractY + 199, abstractX + 27, abstractY + 134);
  }
}


public class Cloud_Night_Normal extends Drawable {

  public Cloud_Night_Normal(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    //back
    fill(#4e3c82);
    noStroke();
    ellipse(abstractX + 119.6, abstractY + 227.9, 191.9, 194.7);
    ellipse(abstractX + 236.5, abstractY + 151.5, 192.9, 169.4);
    ellipse(abstractX + 349.1, abstractY + 201.5, 177.0, 158.5);
    ellipse(abstractX + 388.6, abstractY + 269.0, 202.4, 137.5);
    rect(abstractX + 105.0, abstractY + 226.0, 258.0, 111.0);
    triangle(abstractX + 201, abstractY + 333, abstractX + 613, abstractY + 344, abstractX + 448, abstractY + 281);

    //back2
    fill(#776097);
    noStroke();
    ellipse(abstractX + 125.6, abstractY + 235.6, 187.9, 194.8);
    ellipse(abstractX + 234.9, abstractY + 160.9, 176.3, 167.8);
    ellipse(abstractX + 349.1, abstractY + 208.6, 164.0, 156.5);
    ellipse(abstractX + 382.5, abstractY + 269.5, 197.3, 127.3);
    rect(abstractX + 105.0, abstractY + 226.0, 258.0, 82.6);
    triangle(abstractX + 201, abstractY + 335, abstractX + 598, abstractY + 345, abstractX + 401, abstractY + 273);

    //front
    fill(#d4d5f7);
    noStroke();
    ellipse(abstractX + 112.6, abstractY + 260.5, 148.4, 153.7);
    ellipse(abstractX + 236.5, abstractY + 231.1, 202.2, 195.5);
    ellipse(abstractX + 352.0, abstractY + 245.6, 121.0, 121.0);
    ellipse(abstractX + 388.6, abstractY + 287.9, 107.5, 99.7);
    rect(abstractX + 105.0, abstractY + 226.0, 258.0, 111.0);
    triangle(abstractX + 201, abstractY + 335, abstractX + 513, abstractY + 341, abstractX + 311, abstractY + 268);

    //front2
    fill(#9d85aa);
    noStroke();
    ellipse(abstractX + 124.0, abstractY + 270.0, 155.0, 148.8);
    ellipse(abstractX + 236.2, abstractY + 215.6, 170.3, 146.6);
    ellipse(abstractX + 346.3, abstractY + 268.2, 127.6, 148.8);
    ellipse(abstractX + 358.6, abstractY + 288.5, 152.8, 109.9);
    rect(abstractX + 105.0, abstractY + 246.0, 241.1, 95.7);
    triangle(abstractX + 201, abstractY + 341, abstractX + 498, abstractY + 342, abstractX + 276, abstractY + 266);
  }
}

public class Cloud_Night_Small extends Drawable {

  public Cloud_Night_Small(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    //back
    fill(#513988);
    noStroke();
    ellipse(abstractX + 138.2, abstractY + 257.6, 140, 140);
    ellipse(abstractX + 234.8, abstractY + 205.0, 140, 120);
    ellipse(abstractX + 326.3, abstractY + 231.3, 113, 100);
    ellipse(abstractX + 366.3, abstractY + 280.7, 140, 109);
    rect(abstractX + 105.0, abstractY + 226.0, 129, 55);
    triangle(abstractX + 201, abstractY + 333, abstractX + 613, abstractY + 354, abstractX + 373, abstractY + 281);

    //back2
    fill(#6961b6);
    noStroke();
    ellipse(abstractX + 140.3, abstractY + 259.6, 130, 130);
    ellipse(abstractX + 234.4, abstractY + 209.1, 130, 110);
    ellipse(abstractX + 323.0, abstractY + 238.2, 110, 100);
    ellipse(abstractX + 362.0, abstractY + 283.6, 130, 103);
    rect(abstractX + 105.0, abstractY + 226.0, 129, 41.3);
    triangle(abstractX + 201, abstractY + 335, abstractX + 598, abstractY + 353, abstractX + 314, abstractY + 273);

    //front
    fill(#e6e2ff);
    noStroke();
    ellipse(abstractX + 148.9, abstractY + 279.4, 120, 121);
    ellipse(abstractX + 237.9, abstractY + 253.5, 140, 140);
    ellipse(abstractX + 323.7, abstractY + 262.8, 90, 90);
    ellipse(abstractX + 369.4, abstractY + 294.0, 82, 83);
    rect(abstractX + 132.5, abstractY + 226.0, 129, 55);
    triangle(abstractX + 201, abstractY + 335, abstractX + 513, abstractY + 350, abstractX + 262, abstractY + 268);

    //front2
    fill(#c8c0e5);
    noStroke();
    ellipse(abstractX + 156.3, abstractY + 286.2, 125, 120);
    ellipse(abstractX + 238.1, abstractY + 251.3, 130, 110);
    ellipse(abstractX + 319.9, abstractY + 280.3, 95, 110);
    ellipse(abstractX + 345.3, abstractY + 296.3, 120, 85);
    rect(abstractX + 138.7, abstractY + 266.4, 120.5, 47.8);
    triangle(abstractX + 164, abstractY + 344, abstractX + 498, abstractY + 349, abstractX + 210, abstractY + 266);
  }
}

public class Cloud_Night_VerySmall extends Drawable {

  public Cloud_Night_VerySmall(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    //back
    fill(#5c3a8a);
    noStroke();
    ellipse(abstractX + 57, abstractY + 132, 138.0, 127.1);
    ellipse(abstractX + 124.1, abstractY + 92.7, 128.6, 112.9);
    ellipse(abstractX + 195, abstractY + 114.1, 118.0, 105.9);
    ellipse(abstractX + 224.3, abstractY + 150.8, 135.4, 91.7);
    rect(abstractX + 52.5, abstractY + 113, 193.5, 83.4);
    triangle(abstractX + 209, abstractY + 195, abstractX + 371, abstractY + 201, abstractX + 224, abstractY + 141);

    //back2
    fill(#9a87ae);
    noStroke();
    ellipse(abstractX + 58, abstractY + 136.6, 125.9, 117.0);
    ellipse(abstractX + 124.8, abstractY + 99.8, 118.2, 111.5);
    ellipse(abstractX + 190, abstractY + 121.0, 109.4, 104.5);
    ellipse(abstractX + 223.2, abstractY + 151.0, 123.8, 84.9);
    rect(abstractX + 52.5, abstractY + 113, 193.5, 69.2);
    triangle(abstractX + 360, abstractY + 201, abstractX + 78, abstractY + 195, abstractX + 174, abstractY + 143);

    //front
    fill(#dee0ff);
    noStroke();
    ellipse(abstractX + 55.1, abstractY + 148.3, 99.0, 102.5);
    ellipse(abstractX + 124.8, abstractY + 133.3, 118.9, 120.8);
    ellipse(abstractX + 184.1, abstractY + 136.3, 80.3, 80.3);
    ellipse(abstractX + 219.7, abstractY + 161.1, 76.0, 77.5);
    rect(abstractX + 52.5, abstractY + 113, 159.7, 83.4);
    triangle(abstractX + 312, abstractY + 201, abstractX + 161, abstractY + 192, abstractX + 123, abstractY + 130);

    //front2
    fill(#bdbae1);
    noStroke();
    ellipse(abstractX + 65.4, abstractY + 151.0, 102.1, 94.9);
    ellipse(abstractX + 122.9, abstractY + 115.4, 90.6, 69.3);
    ellipse(abstractX + 178.2, abstractY + 137.3, 81.6, 68.2);
    ellipse(abstractX + 220.9, abstractY + 162.2, 59.0, 68.9);
    rect(abstractX + 62.0, abstractY + 126.7, 154.5, 71.8);
    triangle(abstractX + 297, abstractY + 199, abstractX + 198, abstractY + 199, abstractX + 27, abstractY + 134);
  }
}