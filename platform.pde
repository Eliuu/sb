class Platform extends GameObj {
  //PVector pos;
  Platform(float x, float y) {
    vel = new PVector(1,0);
    pos = new PVector(x, y);
    vel.setMag(random(0,2));
  }
  void show() {
    stroke(0);
    line(pos.x, pos.y, pos.x+50, pos.y);
  }
  boolean collide(PVector p) {
    if (p.x > pos.x && p.y > pos.y && p.x < pos.x+50 && p.y < pos.y + 10) {
      return true;
    }
    return false;
  }
  void act (){
    pos.add(vel);
  }
}
