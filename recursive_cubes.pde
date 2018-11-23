
ArrayList<Box> boxes;

boolean start = true;
boolean shrinkComplete = false;

int lvl = 0;
int lvlLimit = 6;

int curSize = 0;

void setup() {
  size(600, 600, P3D);
  noStroke(); // I will remove this later when I add shading.

  boxes = new ArrayList<Box>();
  boxes.add(new Box(0, 0, 0, 300));
}

void draw() {
  background(75);
  if (start && millis() > 2500) {
    start = false;
    shrinkComplete = true;
  }

  //lights();
  directionalLight(255, 255, 255, -1, 1, -0.2);
  directionalLight(255, 255, 255, 1, 1, -0.2);
  directionalLight(255, 255, 255, -1, -1, -0.2);
  directionalLight(255, 255, 255, 1, -1, -0.2);

  translate(width/2, height/2);
  updateAngles();

  int num = boxes.size();
  int shouldBe = (int)pow(4, lvl);
  if (lvl > 0) {
    if (num == shouldBe) {
      shrinkComplete = true;
    }
  }

  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    b.show();
    b.update();
    if (shrinkComplete) {
      if (lvl < lvlLimit) {
        b.generate();
        boxes.remove(b);
      }
    }
  }
  if (shrinkComplete) {
    lvl++;
    shrinkComplete = false;
  }

  //saveFrame("output/sierpinski-####.png");
}


float xAngle = 0;
float yAngle = 0;
float dAngle = 0.005;
void updateAngles() {
  rotateX(xAngle);
  rotateY(yAngle);
  xAngle += dAngle;
  yAngle += dAngle;
}
