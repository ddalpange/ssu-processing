export class PVector {
  x: number = 0;
  y: number = 0;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  static random2D(): PVector {
    const angle = Math.random() * 2 * Math.PI;
    const x = Math.cos(angle);
    const y = Math.sin(angle);
    return new PVector(x, y);
  }

  mult(scalar: number): PVector {
    this.x *= scalar;
    this.y *= scalar;
    return this;
  }
}
