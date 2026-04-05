import java.awt.Graphics;
import java.awt.image.BufferedImage;

public class Target extends GameObject {
    private boolean visible = true;

    public Target(int x, int y) {
        super(x, y);
        setImage(ResourceLoader.loadImage("/resources/target.png"));
    }

    public void hide() {
        visible = false;
    }

    public void show() {
        visible = true;
    }

    public boolean isVisible() {
        return visible;
    }

    @Override
    public void draw(Graphics g) {
        if (visible) {
            super.draw(g);
        }
    }
}