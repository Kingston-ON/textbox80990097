void mouseReleased() {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameoverClicks();
}

//textbox interactions
void mousePressed() {
  for (Textbox t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
}

void keyPressed() {
  for (Textbox t : textboxes) {
    t.keyPressed(key, keyCode);
    send = true;
    //message = "Message is:" + textboxes.get(1).Text;
  }
}


//rectangular buttons
void rectButton (String text, float x, float y, float w, float h) {
    if (mouseX> x-w/2 && mouseX < x+w/2 && mouseY > y-h/2&& mouseY < y+h/2) {
    strokeWeight(10);
    stroke(255, 0, 0);
    fill(255);
  } else {
    strokeWeight(2);
    stroke(0);
    fill(255);
  }
  textSize(20);
  rect(x, y, w, h);
  fill(0);
  text(text, x- w/2, y);
}

boolean clickedOnRect(float x, float y, float w, float h) {
  return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY <y+h/2;
}
