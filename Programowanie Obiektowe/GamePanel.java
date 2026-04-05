import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;

public class GamePanel extends JPanel {
    private GameBoard board;

    public GamePanel(GameBoard board) {
        this.board = board;
        setBackground(new Color(240, 240, 240));
    }

    public void setBoard(GameBoard board) {
        this.board = board;
        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        if (board == null) return;

        int panelWidth = getWidth();
        int panelHeight = getHeight();

        int tileSize = Math.min(
                panelWidth / Math.max(board.getWidth(), 1),
                panelHeight / Math.max(board.getHeight(), 1)
        );

        int offsetX = (panelWidth - tileSize * board.getWidth()) / 2;
        int offsetY = (panelHeight - tileSize * board.getHeight()) / 2;

        drawGameObjects(g, tileSize, offsetX, offsetY);
    }

    private void drawGameObjects(Graphics g, int tileSize, int offsetX, int offsetY) {
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);

        // Rysuj widoczne cele
        for (Target target : board.getTargets()) {
            if (target.isVisible()) {
                drawScaled(g2d, target, tileSize, offsetX, offsetY);
            }
        }

        // Rysuj pozostałe obiekty
        for (int x = 0; x < board.getWidth(); x++) {
            for (int y = 0; y < board.getHeight(); y++) {
                GameObject obj = board.getGrid()[x][y];
                if (obj != null && !(obj instanceof Target)) {
                    drawScaled(g2d, obj, tileSize, offsetX, offsetY);
                }
            }
        }
    }

    private void drawScaled(Graphics2D g2d, GameObject obj, int tileSize, int offsetX, int offsetY) {
        Graphics2D g = (Graphics2D) g2d.create();
        try {
            int x = offsetX + obj.getX() * tileSize;
            int y = offsetY + obj.getY() * tileSize;

            g.translate(x, y);

            if (obj.image != null) {
                double scaleX = (double) tileSize / obj.image.getWidth();
                double scaleY = (double) tileSize / obj.image.getHeight();
                g.scale(scaleX, scaleY);
                g.drawImage(obj.image, 0, 0, null);
            } else {
                double scale = tileSize / 40.0;
                g.scale(scale, scale);
                obj.draw(g);
            }
        } finally {
            g.dispose();
        }
    }

    @Override
    public Dimension getPreferredSize() {
        return new Dimension(board.getWidth() * 64, board.getHeight() * 64);
    }
}