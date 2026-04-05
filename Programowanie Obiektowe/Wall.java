public class Wall extends GameObject {
    public Wall(int x, int y) {
        super(x, y);
        // Ładowanie obrazu ściany
        setImage(ResourceLoader.loadImage("/resources/wall.png"));
    }
}