public class Player extends GameObject {
    public Player(int x, int y) {
        super(x, y);
        // Ładowanie obrazu gracza
        setImage(ResourceLoader.loadImage("/resources/player.png"));
    }
}