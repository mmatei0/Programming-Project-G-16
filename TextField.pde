class TextField {
    float x, y, w, h;
    String text = "";
    boolean active = false;
    String placeholder;

    TextField(float x, float y, float w, float h, String placeholder) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.placeholder = placeholder;
    }

    void display() {
        fill(active ? 255 : 200);
        rect(x, y, w, h, 5);
        
        fill(0);
        textSize(16);
        textAlign(LEFT, CENTER);
        if (text.equals("") && !active) {
        fill(100);
        text(placeholder, x + 5, y + h / 2);
      } else {
        fill(0);
        text(text, x + 5, y + h / 2);
      }
    }

    void handleClick(float mx, float my) {
        active = (mx > x && mx < x + w && my > y && my < y + h);
    }

    void handleTyping(char k) {
        if (active) {
            if (k == BACKSPACE && text.length() > 0) {
                text = text.substring(0, text.length() - 1);
            } else if (k != CODED) {
              text += k;
            }
        }
    }

    String getText() {
        return text.trim();
    }
    
    void clear() {
    text = "";
  }
}
