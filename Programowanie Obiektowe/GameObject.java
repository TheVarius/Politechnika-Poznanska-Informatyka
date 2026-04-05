import java.awt.*;
import java.awt.image.BufferedImage;

public abstract class GameObject {
    private int x;
    private int y;
    protected BufferedImage image;

    public GameObject(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public void draw(Graphics g) {
        if (image != null) {
            g.drawImage(image, 0, 0, null);
        } else {
            // Fallback rendering
            g.setColor(Color.LIGHT_GRAY);
            g.fillRect(0, 0, 40, 40);
            g.setColor(Color.DARK_GRAY);
            g.drawRect(0, 0, 40, 40);
        }
    }

    public void setImage(BufferedImage image) {
        this.image = image;
    }

    // Gettery i settery
    public int getX() { return x; }
    public int getY() { return y; }
    public void setX(int x) { this.x = x; }
    public void setY(int y) { this.y = y; }
}