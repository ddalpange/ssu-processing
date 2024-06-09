export class TimeTracker {
  private curTime: number = 0;
  private prevTime: number = 0;

  public update(deltaTime: number): void {
    this.prevTime = this.curTime;
    this.curTime += deltaTime;
  }

  public ifTimeIs(time: number): boolean {
    return this.inRange(time, this.prevTime, this.curTime);
  }

  public ifTimeOver(time: number): boolean {
    return this.curTime >= time;
  }

  public getCurrentTime(): number {
    return this.curTime;
  }

  private inRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }
}
