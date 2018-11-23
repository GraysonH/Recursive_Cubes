

class Box {
  float x, y, z, s;
  color c;
  boolean shrinking = false;
  float shrinkSpeed;

  Box(float x, float y, float z, float s) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.s = s;

    this.c = #6AE1F0;

    this.shrinkSpeed = this.s/100;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    fill(c);
    box(s);
    popMatrix();
  }

  void update() {
    if (shrinking) {
      this.s -= shrinkSpeed;
      if (this.s <= 0) {
        boxes.remove(this);
      }
    }
  }

  void generate() {
    //these are the good ones that don't shrink.
    boxes.add(new Box(this.x-this.s/4, this.y-this.s/4, this.z-this.s/4, this.s/2));
    boxes.add(new Box(this.x+this.s/4, this.y+this.s/4, this.z-this.s/4, this.s/2));
    boxes.add(new Box(this.x-this.s/4, this.y+this.s/4, this.z+this.s/4, this.s/2));
    boxes.add(new Box(this.x+this.s/4, this.y-this.s/4, this.z+this.s/4, this.s/2));

    //these are the bad ones that do shrink.
    Box temp;
    temp = new Box(this.x-this.s/4, this.y-this.s/4, this.z+this.s/4, this.s/2);
    temp.shrinking = true;
    boxes.add(temp);
    temp = new Box(this.x+this.s/4, this.y+this.s/4, this.z+this.s/4, this.s/2);
    temp.shrinking = true;
    boxes.add(temp);
    temp = new Box(this.x-this.s/4, this.y+this.s/4, this.z-this.s/4, this.s/2);
    temp.shrinking = true;
    boxes.add(temp);
    temp = new Box(this.x+this.s/4, this.y-this.s/4, this.z-this.s/4, this.s/2);
    temp.shrinking = true;
    boxes.add(temp);
  }
}
