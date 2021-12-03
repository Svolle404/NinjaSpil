import processing.sound.*;

kastestjerne[] kastestjerner = new kastestjerne[500];
katana katana;
spiller spiller;
forberedelse forberedelse;
hovedmenu hovedmenu;
deltaTime deltaTime;
hud hud;
powerups powerups;
nunchaku nunchaku;

PImage[] spillerAnimation = new PImage[6];
PImage[] kastestjerne = new PImage[3];
PImage[] powerupIkoner = new PImage[4];
PImage[] nunchakuAnimation = new PImage[6];
PImage katanaSwoosh;
PImage katanaOmraade;
PImage nunchakuOmraade;
PImage boble;
PFont kongtext;
int side = 0;

SoundFile menu;
SoundFile gameplay;
SoundFile katanaAttack;
SoundFile hit;
SoundFile powerupAktiver;
SoundFile powerupSpawn;
SoundFile nunchakuAttack;

boolean gameover = false;

void setup() {
  fullScreen(OPENGL);
  menu = new SoundFile(this, "/lyd/gameplay.wav");
  menu.amp(0.25);
  gameplay = new SoundFile(this, "/lyd/gameplay.wav");
  gameplay.amp(0.25);
  katanaAttack = new SoundFile(this, "/lyd/katana.wav");
  nunchakuAttack = new SoundFile(this, "/lyd/nunchaku.wav");
  hit = new SoundFile(this, "/lyd/hit.wav");
  powerupAktiver = new SoundFile(this, "/lyd/powerupAktiver.wav");
  powerupSpawn = new SoundFile(this, "/lyd/powerupSpawn.wav");
  forberedelse = new forberedelse();
  forberedelse.koer();

  image(katanaSwoosh, 0, 0);
  image(katanaOmraade, 0, 0);
  image(nunchakuOmraade, 0, 0);
  background(0);
}

void draw() {
  background(70, 184, 13);
  deltaTime.beregn();
  if (side == 0) {
    if (gameplay.isPlaying()) {
      gameplay.stop();
    }

    if (!menu.isPlaying()) {
      menu.loop();
    }
    hovedmenu.vis();
    cursor();
  } else  if (side == 1) {
    if (menu.isPlaying()) {
      menu.stop();
    }

    if (!gameplay.isPlaying()) {
      gameplay.loop();
    }

    for (int i = powerups.fjernKastestjerner; i < spiller.svaerhed; i++) {
      if (!gameover) {
        kastestjerner[i].opdater();
      }
      kastestjerner[i].vis();
    }

    if (!gameover) {
      katana.opdater();
      spiller.opdater();
      powerups.opdater();
      nunchaku.opdater();
    }
    powerups.vis();
    spiller.vis();
    nunchaku.vis();
    katana.vis();
    hud.visScore();
    hud.visNedtaelling();
    hud.visLiv();

    if (gameover) {
      noStroke();
      fill(0, 100);
      rect(0, 0, width, height);
      cursor();
    } else {
      noCursor();
    }
  }
  deltaTime.opdater();
}
