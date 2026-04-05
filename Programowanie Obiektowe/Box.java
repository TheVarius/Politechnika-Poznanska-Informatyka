import java.awt.image.BufferedImage;

public class Box extends GameObject {
    private boolean onTarget;
    private BufferedImage boxImage;
    private BufferedImage boxOnTargetImage;

    public Box(int x, int y) {
        super(x, y);
        boxImage = ResourceLoader.loadImage("/resources/box.png");
        boxOnTargetImage = ResourceLoader.loadImage("/resources/box_on_target.png");
        setImage(boxImage);
    }

    public void setOnTarget(boolean onTarget) {
        this.onTarget = onTarget;
        setImage(onTarget ? boxOnTargetImage : boxImage);
    }

    public boolean isOnTarget() {
        return onTarget;
    }
}