public class TimeTracker
{
    private float curTime = 0;
    private float prevTime = 0;

    public void setup()
    {
        curTime = 0;
        prevTime = 0;
    }

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
}
