public class GameEngine {
    private int currentLevel = 1;
    private GameBoard board;
    private LevelManager.Level currentLevelData;

    public void loadLevel() {
        currentLevelData = LevelManager.getLevel(currentLevel);
        if (currentLevelData == null) {
            throw new RuntimeException("Level " + currentLevel + " not found");
        }

        board = new GameBoard(currentLevelData.getWidth(), currentLevelData.getHeight());
        String[] grid = currentLevelData.getGrid();

        for (int y = 0; y < grid.length; y++) {
            for (int x = 0; x < grid[y].length(); x++) {
                char c = grid[y].charAt(x);
                switch (c) {
                    case '#': board.addObject(new Wall(x, y)); break;
                    case 'P': board.addObject(new Player(x, y)); break;
                    case 'B': board.addObject(new Box(x, y)); break;
                    case 'T': board.addObject(new Target(x, y)); break;
                }
            }
        }
    }

    public void restartLevel() {
        loadLevel();
    }
    public void nextLevel() {
        if (currentLevel < LevelManager.totalLevels()) currentLevel++;
    }

    public GameBoard getBoard() { return board; }
    public int getCurrentLevel() { return currentLevel; }
}