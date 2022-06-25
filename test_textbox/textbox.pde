class Textbox {
  int X = 0, Y = 0, H = 35, W = 200;
  int textSize = 24;

  // color palette
  color background = color(140, 140, 140);
  color foreground = color(0, 0, 0);
  color background1 = color(0, 255, 0);
  color border = color(30, 30, 30);

  boolean BorderEnable = false;
  int borderLineWeight = 1;

  String Text = "";
  int textLength = 0;

  boolean selected = false;

  Textbox(int x, int y, int w, int h) {
    X = x;
    Y = y;
    W = w;
    H = h;
  }

  void draw() {
    // background
    if (selected) {
      fill(background1);
    } else {
      fill(background);
    }

    if (BorderEnable) {
      strokeWeight(borderLineWeight);
      stroke(border);
    } else {
      noStroke();
    }

    rect(X, Y, W, H);

    // show the text
    fill(foreground);
    textSize(textSize);
    text(Text, X - W/2 + (textWidth("a") / 2  ), Y - H/2 + textSize);
  }

  // if key i entered: 1
  // else 0
  boolean keyPressed(char KEY, int KeyCode) {
    if (selected) {
      if (KeyCode == (int)BACKSPACE) {
        backSpace();
      } else if (KeyCode == 32) {
        // SPACE
        addText(' ');
      } else if (KeyCode == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
          addText(KEY);
        }
      }
    }
    return false;
  }

  void addText(char text) {
    // if the text is within the boundary of textbox
    if (textWidth(Text + text) < 3*W/4) {
      Text += text;
      textLength++;
    }
  }

  void backSpace() {
    if (textLength - 1 >= 0) {
      Text = Text.substring(0, textLength - 1);
      textLength--;
    }
  }

  // FUNCTION FOR TESTING IS THE POINT
  // OVER THE TEXTBOX
  boolean overBox(int x, int y) {
    if (x >= X - W/2 && x <= X + W/2) {
      if (y >= Y - H/2 && y <= Y + H/2) {
        return true;
      }
    }

    return false;
  }

  void PRESSED(int x, int y) {
    if (overBox(x, y))    selected = true;
    else    selected = false;
  }
}

void layout() {
  Textbox message = new Textbox(width / 2, 150, 300, 100);
  Textbox message[i] = new Textbox(width / 2, 350, 300, 100);
  textboxes.add(message);
  textboxes.add(message2);
}

void textboxDraw() {

  for (Textbox t : textboxes) {
    t.draw();
  }
}
