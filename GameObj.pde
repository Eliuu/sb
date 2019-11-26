abstract class GameObj {
  PVector pos;
  PVector vel;

  GameObj() {
  }
  void show() {
  }
  void act() {
    if (pos.y < -40) pos.y = height+40;
    if (pos.y > height+40) pos.y = -40;
    if (pos.x < -40) pos.x = width + 40;
  }
}
