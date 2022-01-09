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
tabt tabt;

PImage[] spillerAnimation = new PImage[6];
PImage[] kastestjerne = new PImage[3];
PImage[] powerupIkoner = new PImage[4];
PImage[] nunchakuAnimation = new PImage[6];
PImage katanaSwoosh;
PImage katanaOmraade;
PImage nunchakuOmraade;
PImage boble;
PImage baggrund;
PFont kongtext;
int side = 0;

SoundFile menu;
SoundFile gameplay;
SoundFile deathsong;
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
  deathsong = new SoundFile(this, "/lyd/deathsong.wav");
  deathsong.amp(0.25);
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
  image(baggrund, 0, 0, width, height);
  deltaTime.beregn();
  if (side == 0) {
    if (gameplay.isPlaying()) {
      gameplay.stop();
    }
    if (deathsong.isPlaying()) {
      deathsong.stop();
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

    if (!gameover) {
      if (!gameplay.isPlaying()) {
        gameplay.loop();
      }
    } else {
      gameplay.stop();
      if (!deathsong.isPlaying()) {
        deathsong.loop();
      }
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
    if (!gameover) {
      hud.visScore();
      hud.visNedtaelling();
      hud.visLiv();
    }

    if (gameover) {
      noStroke();
      fill(0, 150);
      rect(0, 0, width, height);
      if (tabt.s > 1) {
        rect(0, height/2-66, width, 160);
      }
      cursor();
      tabt.opdater();
      tabt.vis();
    } else {
      noCursor();
    }
  }
  deltaTime.opdater();
}

void keyPressed() {
  if (gameover && tabt.s > 1) {
    if (key >= 65 && key <= 90 || key >= 97 && key <= 122 || key >= 48 && key <= 57) {
      if (tabt.spillerNavn.length() < 10) {
        tabt.spillerNavn += key;
        tabt.spillerNavn = tabt.spillerNavn.toUpperCase();
      }
    }

    if (key == BACKSPACE && tabt.spillerNavn.length() > 0) {
      tabt.spillerNavn = tabt.spillerNavn.substring(0, tabt.spillerNavn.length()-1);
    }
  }

  if (key == 27) {
    key = 0;
  }
}
