public class CreditInfo
{
    private final int lineMaxTextLength = 128;
    
    private String Name;   
    private String[] Tasks;
    
    private boolean NeedFrontSpace;
    private int FrontSpace; // 해당 텍스트의 길이 기준 n줄
    
    private boolean IsSingleText;
    private String SingleText;

    public int Size;
    public int Pos;
    
    public CreditInfo(String name, String[] tasks, int size)
    {
        Name = name;
        Tasks = tasks;
        Size = size;
    }
    
    public CreditInfo(String name, String[] tasks, int size, int frontSpace)
    {
        Name = name;
        Tasks = tasks;
        NeedFrontSpace = true;
        FrontSpace = frontSpace;
        Size = size;
    }
    
    public CreditInfo(String singleText, int size)
    {
        IsSingleText = true;
        SingleText = singleText;
        Size = size; 
    }
    
    public CreditInfo(String singleText, int size, int frontSpace)
    {
        IsSingleText = true;
        NeedFrontSpace = true;
        SingleText = singleText;
        Size = size;
    }
    
    public String GetText(){
        String result = "";
        
        if (IsSingleText){
            result += SingleText;
            return result;
        }
        
        int curTextLength = 0;
        result += Name + " - ";
        curTextLength += result.length();
        for (int i = 0; i < Tasks.length; ++i) {
            var text = Tasks[i];
            var isLastText = i == Tasks.length - 1;
            if(isLastText)
                text += ", ";
            var length = text.length();
            var isOverMaxLength = curTextLength + length > lineMaxTextLength;
            if (isOverMaxLength)
            {
                result += "\n";
                curTextLength = length; // 새로운 값으로 저장
            }
            result += text;
            curTextLength += length;
        }
        return result;
    }
    
    public int GetInterval()
    {
        var lineBreakText = "\n";
        int interval = 1;
        if (NeedFrontSpace)
            interval += FrontSpace;
        
        var text = GetText();
        var prevLength = text.length();
        var nextLength = text.replace(lineBreakText, "").length();
        var noLineBreak = nextLength - prevLength == 0;
        if (!noLineBreak)
            interval += (nextLength - prevLength) / lineBreakText.length();
        
        return interval;
    }
}

public class Scene_Ending extends BaseScene {
    private final int screenEdgeBuffer = 30;

    private int firstIdx;

    float backgroundScrollSpeed = 0.1f;
    float objectScrollSpeed = 0.5f;
    float textScrollSpeed = 1f;
    
    int headLineSize = 32;
    int textSize = 16;
    int defaultBuffer = 20;

    float curScrollPos = 0;

    
    CreditInfo[] infos = {
        new CreditInfo("작업 정보", headLineSize),
        new CreditInfo("방정혁", new String[]{"시나리오 팀장", "크레딧 제작"},textSize),
        new CreditInfo("방정혁2", new String[]{"하이", "네"},textSize),
        new CreditInfo("방정혁3", new String[]{"하이23", "네23"},textSize),

    };

    @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return -1; }
    
    public void setup()
    {
        println("Scene_Ending : setup");
        curScrollPos = height;
        SetPos();
    }

    private void SetPos() // y만
    {
        int curPos = 0;
        for(int i = 0; i < infos.length; i++)
        {
            infos[i].Pos = curPos;
            curPos += infos[i].Size + defaultBuffer;
        }
    }

    private void DrawEnding()
    {
        //적당히 뒷배경 그리면 됨

        curScrollPos -= textScrollSpeed;
        var isLastRanged = firstIdx;
        for(int i = firstIdx; i < infos.length; i++)
        {
            var info = infos[i];
            var pos = info.Pos + curScrollPos; // 이거 때매 문제
            var isOverTop = pos < -screenEdgeBuffer;
            var isIntoScreen = pos <= height + screenEdgeBuffer;
            if(isIntoScreen)
                isLastRanged = i;

            fill(0);
            fontManager.drawText(info.GetText(),width/2,(int)pos, info.Size);

            if(isOverTop)
                firstIdx = i;

            var isOverLast = i > isLastRanged; // 굳이 맨뒤 +1 이후까지 연산할 이유가 없어서
            if(isOverLast)
                break;

            var isOver = firstIdx == infos.length-1; //가장 마지막까지 끝난 상태
            if(isOver)
            {
                //여기서 끝내는 처리 넣으면 될듯
            }
        }
    }
    
    public void draw()
    {
        pushStyle();
        
        println("Scene_Ending : draw");
        background(255, 255, 255);
        DrawEnding();
        
        popStyle();
    }
    
    public void mousePressed()
    {
        sceneManager.loadScene(new Scene_Intro_New());
        println("Scene_Ending : mousePressed");
    }
}
