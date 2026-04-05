import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class SokobanGUI extends JFrame {
    private final GamePanel gamePanel;
    private final GameEngine engine;

    public SokobanGUI() {
        engine = new GameEngine();
        engine.loadLevel();

        setTitle("Sokoban - " + LevelManager.getLevel(engine.getCurrentLevel()).getName());
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        gamePanel = new GamePanel(engine.getBoard());
        add(gamePanel, BorderLayout.CENTER);

        setMinimumSize(new Dimension(640, 480));
        setPreferredSize(new Dimension(1024, 768));
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setLocationRelativeTo(null);
        setVisible(true);

        addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                handleKeyPress(e);
                gamePanel.repaint();
                checkLevelComplete();
            }
        });
    }

    private void handleKeyPress(KeyEvent e) {
        switch (e.getKeyCode()) {
            case KeyEvent.VK_LEFT:
            case KeyEvent.VK_RIGHT:
            case KeyEvent.VK_UP:
            case KeyEvent.VK_DOWN:
                engine.getBoard().movePlayer(
                        e.getKeyCode() == KeyEvent.VK_LEFT ? -1 : e.getKeyCode() == KeyEvent.VK_RIGHT ? 1 : 0,
                        e.getKeyCode() == KeyEvent.VK_UP ? -1 : e.getKeyCode() == KeyEvent.VK_DOWN ? 1 : 0
                );
                break;
            case KeyEvent.VK_R:
                engine.restartLevel();
                gamePanel.setBoard(engine.getBoard());
                break;
        }
        gamePanel.repaint();
        checkLevelComplete();
    }

    private void checkLevelComplete() {
        if (engine.getBoard().isLevelComplete()) {
            if (engine.getCurrentLevel() < LevelManager.totalLevels()) {
                showLevelCompleteMenu();
            } else {
                showFinalCongratulations();
            }
        }
    }

    private void showLevelCompleteMenu() {
        Object[] options = {"Next Level", "Exit"};
        int choice = JOptionPane.showOptionDialog(
                this,
                "Level Completed! What would you like to do?",
                "Level Complete",
                JOptionPane.DEFAULT_OPTION,
                JOptionPane.QUESTION_MESSAGE,
                null,
                options,
                options[0]
        );

        if (choice == 0) {
            loadNextLevel();
        } else {
            exitGame();
        }
    }

    private void loadNextLevel() {
        engine.nextLevel();
        engine.loadLevel();
        updateWindowTitle();
        gamePanel.setBoard(engine.getBoard());
        gamePanel.repaint();
    }

    private void showFinalCongratulations() {
        JOptionPane.showMessageDialog(
                this,
                "Congratulations! You've completed all levels!",
                "Game Completed",
                JOptionPane.INFORMATION_MESSAGE
        );
        exitGame();
    }

    private void updateWindowTitle() {
        setTitle("Sokoban - " + LevelManager.getLevel(engine.getCurrentLevel()).getName());
    }

    private void exitGame() {
        dispose();
        System.exit(0);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new SokobanGUI());
    }
}