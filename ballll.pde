import ddf.minim.*;
Minim minim;
AudioPlayer music;
AudioPlayer jump;

ArrayList<Platform> p;
ArrayList<GameObj> objects;
boolean isColliding = false;
PVector pos;
PVector vel;
PFont font;
float moving = 0;
float walk = 2.5;
float r, b, g;
int lives = 3;
int score = 0;

void setup() {
  


  r = random(170, 255);
  b = random(170, 255);
  g = random(170, 255);
  p = new ArrayList<Platform>();
  objects = new ArrayList<GameObj>();
  font = createFont("game_over.ttf", 20);
  float y = random(300, 350);
  float ory = y;
  for (int i = 0; i < width/50; i++) {
    p.add(new Platform(i*50, y));
    //p.add(new Platform(width/2, height/2));
    y += random(-100, 100);
  }
  pos = new PVector(20, ory);
  vel = new PVector();
}
void settings() {
  minim = new Minim(this);
  music = minim.loadFile("bgm.mp3");
  jump = minim.loadFile("bounce.wav");
  size(800, 600);
  music.play();
}
void draw() {
  println(lives);
  background(r, b, g);
  isColliding = false;
  for (Platform i : p) {
    i.show();
    if (i. collide(pos)) {
      isColliding = true;
      pos.y = i.pos.y;
    }
  }
  if (pos.x > width) {
    setup();
    draw();
  }
  if (pos.y > height) {
    setup();
    draw();
    lives--;
  }

  fill(0);
  noStroke();
  ellipse(pos.x, pos.y - 8, 16, 16);
  fill(0);
  textFont(font, 40);
  text("lives: " + lives, 20, 30);

  if (!isColliding) {
    vel.y += 0.3;
  }
  //if (isColliding) {
  //  int i2=0;
  //  while (i2<50) {
  //    objects.add(new Particle(pos.x, pos.y, random(-5, 5), random(-5, 5)));
  //    i2++;
  //  }
  //}
  pos.add(vel);
  pos.x += moving;
  vel.mult(.9);
  if (pos.x < 2) pos.x = 2;

  if (lives <= 0) {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textFont(font, 105);
    text("Gameover...", width/2-100, height/2);
  }
}
void keyPressed() {
  if (key == 'a') {
    moving = -walk;
  }
  if (key == 'd') {
    moving = walk;
  }
  if (key == ' ') {
    jump.rewind();
    jump.play();
    if (isColliding) {
      vel.y -= 15;
    }
  }
}

void keyReleased() {
  if (key == 'a') {
    moving = 0;
  }  
  if (key == 'd') {
    moving = 0;
  }
}
