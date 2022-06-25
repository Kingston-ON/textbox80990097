ArrayList<Textbox> textboxes = new ArrayList<Textbox>();


//constant
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
int mode;

//textbox variables
boolean send = false;

int i=0;
int n = 1;
while (i<n) {
  String message[] = "";
  i++;
}


void setup() {
  size(800, 800);
  rectMode(CENTER);
  message = new int[n];
  mode = INTRO;
  layout();
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == GAMEOVER) gameover();
  else if (mode == PAUSE) pause();
}
