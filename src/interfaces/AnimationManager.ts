import { BaseAnimation } from "./BaseAnimation";

export class AnimationManager {
  animations: BaseAnimation[] = [];

  startAnimation(animation: BaseAnimation): void {
    this.animations.push(animation);
  }

  stopAnimation(animation: BaseAnimation): void {
    const index = this.animations.indexOf(animation);
    if (index !== -1) {
      this.animations.splice(index, 1);
    }
  }

  clearAnimation(): void {
    this.animations.length = 0;
  }

  update(): void {
    const toRemove: BaseAnimation[] = [];
    for (const anim of this.animations) {
      anim.update();
      if (anim.isDone) {
        toRemove.push(anim);
      }
    }

    for (const anim of toRemove) {
      const index = this.animations.indexOf(anim);
      if (index !== -1) {
        this.animations.splice(index, 1);
      }
    }
  }
}
