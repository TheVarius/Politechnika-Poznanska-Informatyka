import java.util.ArrayList;
import java.util.List;

public class LevelManager {
    private static final List<Level> LEVELS = new ArrayList<>();

    static {
        LEVELS.add(new Level(
                "Level 1",
                new String[]{
                        "#####",
                        "#T P#",
                        "# B #",
                        "#   #",
                        "#####"
                }
        ));

        LEVELS.add(new Level(
                "Level 2",
                new String[]{
                        "#######",
                        "#T# ###",
                        "#  B ##",
                        "#    P#",
                        "#######"
                }
        ));
        LEVELS.add(new Level(
                "Level 3",
                new String[]{
                        "#######",
                        "#T    #",
                        "#  #B##",
                        "#     #",
                        "# P   #",
                        "#######"
                }
        ));

        LEVELS.add(new Level(
                "Level 4",
                new String[]{
                        "#########",
                        "#T      #",
                        "######  #",
                        "#   B   #",
                        "#   P   #",
                        "#########"
                }
        ));
        LEVELS.add(new Level(
                "Level 5",
                new String[]{
                        "########",
                        "#        ",
                        "#  T  B ",
                        "# #### #",
                        "#  P   #",
                        "########"
                }
        ));
        LEVELS.add(new Level(
                "Level 6",
                new String[]{
                        "#########",
                        "#T      #",
                        "# ##### #",
                        "# #   # #",
                        "# # P # #",
                        "# ### # #",
                        "#     B #",
                        "#       #",
                        "#########"
                }
        ));
        LEVELS.add(new Level(
                "Level 7",
                new String[]{
                        "           ",
                        "###  #####",
                        "#T#  ##   ",
                        "# #B #   #",
                        "# # ##   #",
                        "#        #",
                        "#  P   ###",
                        "###########"
                }
        ));

        LEVELS.add(new Level(
                "Level 8 ",
                new String[]{
                        "#########",
                        "#T     T#",
                        "#  B B  #",
                        "#   #   #",
                        "#   P   #",
                        "#########"
                }
        ));

        LEVELS.add(new Level(
                "Level 9",
                new String[]{
                        "#########",
                        "#T  B  T#",
                        "#    #  #",
                        "##B P B##",
                        "#  #    #",
                        "#T  B  T#",
                        "#########"
                }
        ));
        LEVELS.add(new Level(
                "Level 10",
                new String[]{
                        "#########",
                        "#T     T#",
                        "# ## ## #",
                        "# B P B #",
                        "# ## ## #",
                        "#T  B   #",
                        "#########"
                }
        ));

    }

    public static class Level {
        private final String name;
        private final String[] grid;

        public Level(String name, String[] grid) {
            this.name = name;
            this.grid = grid;
        }

        public String getName() { return name; }
        public String[] getGrid() { return grid; }
        public int getWidth() { return grid[0].length(); }
        public int getHeight() { return grid.length; }
    }

    public static Level getLevel(int number) {
        if (number < 1 || number > LEVELS.size()) return null;
        return LEVELS.get(number - 1);
    }

    public static int totalLevels() {
        return LEVELS.size();
    }
}