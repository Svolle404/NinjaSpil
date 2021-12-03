class forberedelse {
  void koer() {
    frameRate(999);
    ((PGraphicsOpenGL)g).textureSampling(3);
    kongtext = createFont("kongtext.ttf", 40);
    for (int i = 0; i < kastestjerne.length; i++) {
      kastestjerne[i] = loadImage("/kastestjerne/"+i+".png");
    }
    for (int i = 0; i < powerupIkoner.length; i++) {
      powerupIkoner[i] = loadImage("/powerups/"+i+".png");
    }
    for (int i = 0; i < spillerAnimation.length; i++) {
      spillerAnimation[i] = loadImage("/ballon/"+i+".png");
    }
    for (int i = 0; i < nunchakuAnimation.length; i++) {
      nunchakuAnimation[i] = loadImage("/nunchaku/"+i+".png");
    }
    katanaSwoosh = loadImage("katanaSwoosh.png");
    katanaOmraade = loadImage("katanaOmraade.png");
    nunchakuOmraade = loadImage("nunchakuOmraade.png");
    boble = loadImage("boble.png");
    for (int i = 0; i < kastestjerner.length; i++) {
      kastestjerner[i] = new kastestjerne();
    }
    katana = new katana();
    spiller = new spiller();
    hovedmenu = new hovedmenu();
    deltaTime = new deltaTime();
    hud = new hud();
    powerups = new powerups();
    nunchaku = new nunchaku();
  }
}
