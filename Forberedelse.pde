class forberedelse {
  void koer() {
    frameRate(999);
    ((PGraphicsOpenGL)g).textureSampling(3);
    kongtext = createFont("kongtext.ttf", 40);
    for (int i = 0; i < kastestjerne.length; i++) {
      kastestjerne[i] = loadImage("/sprites/kastestjerne/"+i+".png");
    }
    for (int i = 0; i < powerupIkoner.length; i++) {
      powerupIkoner[i] = loadImage("/sprites/powerups/"+i+".png");
    }
    for (int i = 0; i < spillerAnimation.length; i++) {
      spillerAnimation[i] = loadImage("/sprites/ballon/"+i+".png");
    }
    for (int i = 0; i < nunchakuAnimation.length; i++) {
      nunchakuAnimation[i] = loadImage("/sprites/nunchaku/"+i+".png");
    }
    katanaSwoosh = loadImage("/sprites/katanaSwoosh.png");
    katanaOmraade = loadImage("/sprites/katanaOmraade.png");
    nunchakuOmraade = loadImage("/sprites/nunchakuOmraade.png");
    boble = loadImage("/sprites/boble.png");
    baggrund = loadImage("/sprites/temp.jpg");
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
    tabt = new tabt();
  }
}
