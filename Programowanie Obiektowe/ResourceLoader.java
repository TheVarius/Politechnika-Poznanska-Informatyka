import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;

public class ResourceLoader {
    public static BufferedImage loadImage(String path) {
        try {
            BufferedImage image = ImageIO.read(ResourceLoader.class.getResource(path));
            if (image == null) {
                throw new RuntimeException("Image file not found: " + path);
            }
            return image;
        } catch (IOException | IllegalArgumentException e) {
            throw new RuntimeException("Error loading image: " + path, e);
        }
    }
}