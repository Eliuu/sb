float x,y,vx,vy;
class Particle extends GameObj{

  float alpha;

  Particle(float _x, float _y, float _vx, float _vy) {
    x=_x;
    y=_y;
    vx=_vx;
    vy=_vy;

    alpha=255;
    lives = 1;
  }

  void show() {
    noStroke();
    fill(255, alpha);
    ellipse(x, y, 5, 5);
  }

  void act() {
    x=x+vx;
    y=y+vy;

    alpha=alpha-10;
    if (alpha<=0) lives = 0;
  }
}
