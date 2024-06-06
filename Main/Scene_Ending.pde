public class Scene_Ending extends BaseScene {

    @Override
    public int getPreviousScene() { return -1; }

    @Override
    public int getNextScene() { return -1; }

    private final int defaultImageHeight = 1055;
    private final float scaleMultiple = 3;
    private final int heightBuffer = 300;

    private final float moveSpeed = 2;
    private final float moveSpeedMultiple = 3;

    private float curHeight = 0;
    private float endHeight = 0;
    private boolean isEnd = false;
    private ShapeObject endingBox;
    private boolean isMousePressing = false;

    public void setup()
    {
        println("Scene_Ending : setup");
        loadBackground("59", drawManager);
        curHeight = -defaultImageHeight*scaleMultiple/2 + heightBuffer;
        endHeight = defaultImageHeight*scaleMultiple/2;

        endingBox = objectFactory.create("res/images/ui/ending_box2.png");
        endingBox.setPosition(width/2, curHeight);
        endingBox.setScale(scaleMultiple, scaleMultiple);
        drawManager.addDrawable(endingBox);

        var endingHead = objectFactory.create("res/images/ui/ending_box.png");
        endingHead.setPosition(width/2, 60);
        endingHead.setScale(scaleMultiple, scaleMultiple);
        drawManager.addDrawable(endingHead);

        isEnd = false;
    }

    public void draw()
    {
        pushStyle();
        
        background(255, 255, 255);
        drawManager.drawing();
        mouseUpdate();
        scrollUpdate();
        popStyle();
    }

    private void mouseUpdate()
    {
        isMousePressing = mousePressed? true : false;
    }

    private void scrollUpdate()
    {
        if(isEnd)
            return;

            curHeight += isMousePressing ? moveSpeed * moveSpeedMultiple : moveSpeed;
            endingBox.setPosition(width/2, curHeight);

            var isOver = curHeight >= endHeight;
            if(isOver && !isEnd)
            {
                sceneManager.loadScene(new Scene_Intro_New());
                isEnd = true;
            }
    }
}
