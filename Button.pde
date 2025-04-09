class Button {
    float x, y, w, h;
    String label;
    boolean hover = false;
    
    Button(float x, float y, float w, float h, String label) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.label = label;
    }
    
    void display() {
        fill(hover ? color(100, 150, 255) : color(70, 130, 180));
        rect(x, y, w, h, 5);
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(16);
        text(label, x + w/2, y + h/2);
    }
    
    boolean isClicked(float mx, float my) {
        return mx > x && mx < x + w && my > y && my < y + h;
    }
    
    void checkHover(float mx, float my) {
        hover = isClicked(mx, my);
    }
}
