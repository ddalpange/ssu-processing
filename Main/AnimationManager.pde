public class AnimationManager {
    public ArrayList<BaseAnimation> animations = new ArrayList<BaseAnimation>();

    public void startAnimation(BaseAnimation animation) {
        animations.add(animation);
    }

    public void stopAnimation(BaseAnimation animation)
    {
        if(animations.contains(animation))
            animations.remove(animation);
    }

    public void clearAnimation()
    {
     animations.clear();
    }

    public void update() {
        ArrayList<BaseAnimation> toRemove = new ArrayList<BaseAnimation>();
        for (BaseAnimation anim : animations) {
            anim.update();
            if (anim.isDone) {
                toRemove.add(anim);
            }
        }

        for (BaseAnimation anim : toRemove) {
            animations.remove(anim);
        }
    }
}
