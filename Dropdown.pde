class Dropdown {
    float x, y, w, h;
    String[] options;
    boolean open = false;
    String selected = "";

    Dropdown(float x, float y, float w, float h, String[] options) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.options = options;
    }

    void display() {
        fill(255);
        rect(x, y, w, h, 5);
        fill(0);
        textAlign(LEFT, CENTER);
        textSize(16);
        text(selected.equals("") ? "Choose option" : selected, x + 10, y + h / 2);
        if (open) {
            for (int i = 0; i < options.length; i++) {
                fill(200);
                rect(x, y + h * (i + 1), w, h);
                fill(0);
                text(options[i], x + 10, y + h * (i + 1) + h / 2);
            }
        }
    }

    void handleClick(float mx, float my) {
        if (mx > x && mx < x + w && my > y && my < y + h) {
            open = !open;
        } else if (open) {
            for (int i = 0; i < options.length; i++) {
                float optionY = y + h * (i + 1);
                if (mx > x && mx < x + w && my > optionY && my < optionY + h) {
                    selected = options[i];
                    open = false;
                    break;
                }
            }
        } else {
            open = false;
        }
    }

    String getSelected() {
        return selected;
    }
}
