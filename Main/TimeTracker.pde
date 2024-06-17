public class TimeTracker // 사용법 : 변수로 만들고 setup과 update만 해당 씬의 구간에 잘 넣어주세요
{
    private float curTime = 0;
    private float prevTime = 0;

    public void update()
    {
      prevTime = curTime;
      curTime += deltaTime;
    }

    public boolean IfTimeIs(float time)
    {
        return Util.InRange(time, prevTime, curTime);
    }

    public boolean IfTimeOver(float time)
    {
     return curTime >= time;
    }

    public float GetCurrentTime()
    {
        return curTime;
    }
}
