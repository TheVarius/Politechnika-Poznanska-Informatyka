import java.util.ArrayList;
import java.util.List;

public class GameBoard {
    private GameObject[][] grid;
    private Player player;
    private final List<Box> boxes = new ArrayList<>();
    private final List<Target> targets = new ArrayList<>();
    private final int width;
    private final int height;

    public GameBoard(int width, int height) {
        this.width = width;
        this.height = height;
        this.grid = new GameObject[width][height];
    }

    public void addObject(GameObject obj) {
        grid[obj.getX()][obj.getY()] = obj;
        if (obj instanceof Player) {
            player = (Player) obj;
        } else if (obj instanceof Box) {
            boxes.add((Box) obj);
        } else if (obj instanceof Target) {
            targets.add((Target) obj);
        }
    }

    public boolean movePlayer(int dx, int dy) {
        int newX = player.getX() + dx;
        int newY = player.getY() + dy;

        if (!isValidPosition(newX, newY)) return false;

        GameObject cell = grid[newX][newY];

        if (cell instanceof Wall) return false;

        if (cell instanceof Box) {
            Box box = (Box) cell;
            int boxX = newX + dx;
            int boxY = newY + dy;

            if (!isValidPosition(boxX, boxY) ||
                    grid[boxX][boxY] instanceof Wall ||
                    grid[boxX][boxY] instanceof Box) {
                return false;
            }

            moveBox(box, boxX, boxY);
        }

        updatePlayerPosition(newX, newY);
        return true;
    }

    private void updatePlayerPosition(int x, int y) {
        grid[player.getX()][player.getY()] = null;
        player.setX(x);
        player.setY(y);
        grid[x][y] = player;
    }

    private void moveBox(Box box, int x, int y) {
        // Przywróć cel jeśli skrzynka go opuszcza
        targets.stream()
                .filter(t -> t.getX() == box.getX() && t.getY() == box.getY())
                .forEach(Target::show);

        grid[box.getX()][box.getY()] = null;
        box.setX(x);
        box.setY(y);
        grid[x][y] = box;

        // Ukryj cel pod skrzynką
        targets.stream()
                .filter(t -> t.getX() == x && t.getY() == y)
                .forEach(Target::hide);

        checkTarget(box);
    }

    private void checkTarget(Box box) {
        boolean onTarget = targets.stream().anyMatch(t ->
                t.getX() == box.getX() && t.getY() == box.getY()
        );
        box.setOnTarget(onTarget);
    }

    private boolean isValidPosition(int x, int y) {
        return x >= 0 && x < width && y >= 0 && y < height;
    }

    public boolean isLevelComplete() {
        return boxes.stream().allMatch(Box::isOnTarget);
    }

    // Gettery
    public GameObject[][] getGrid() { return grid; }
    public List<Target> getTargets() { return targets; }
    public int getWidth() { return width; }
    public int getHeight() { return height; }
}