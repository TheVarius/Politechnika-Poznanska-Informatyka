STYLE_SHEET = """
/* Main windows and dialog background settings */
QMainWindow, QDialog, QMessageBox, QInputDialog { 
    background-color: #0b0e11; 
}

/* Global widget text and font properties */
QWidget { 
    color: #dcddde; 
    font-family: 'Segoe UI', sans-serif; 
    font-size: 16px; 
    outline: none; 
}

/* Informational tooltip styling */
QToolTip {
    background-color: #15191d;
    color: #dcddde;
    border: 1px solid #5865f2;
    border-radius: 5px;
    padding: 5px;
}

QDialog QLabel, QMessageBox QLabel {
    color: #dcddde;
}

/* Card container styling with rounded corners and borders */
QFrame#Card { 
    background-color: #15191d; 
    border-radius: 12px; 
    border: 1px solid #2f3337; 
}

/* Text input field styling and focus states */
QLineEdit { 
    background-color: #202225; 
    border: 1px solid #1e1f22; 
    padding: 12px; 
    border-radius: 8px; 
    color: white; 
}
QLineEdit:focus { border: 1px solid #5865f2; }

/* General button styles and color variants */
QPushButton { 
    background-color: #5865f2; 
    border: none; 
    padding: 12px; 
    border-radius: 8px; 
    font-weight: bold; 
    color: white; 
    min-width: 50px;
}
QPushButton:hover { background-color: #4752c4; }
QPushButton:pressed { background-color: #353da1; }

QPushButton#Secondary { background-color: #6c5ce7; }
QPushButton#Secondary:hover { background-color: #5a4cc7; }

QPushButton#Tertiary { background-color: #00b894; }
QPushButton#Tertiary:hover { background-color: #00a383; }

QPushButton#Danger { background-color: #ed4245; }
QPushButton#Danger:hover { background-color: #c0392b; }

/* Specific button overrides for dialog popups */
QPushButton#DialogOk { background-color: #00b894; }
QPushButton#DialogCancel { background-color: #ed4245; }

/* Interactive lists and multi-line text area components */
QTextEdit, QListWidget { 
    background-color: #2f3136; 
    border: none; 
    border-radius: 8px; 
    outline: none; 
}

/* List item hover and selection states */
QListWidget::item { 
    padding: 18px; 
    border-radius: 8px; 
    margin-bottom: 5px; 
    border: none;
}
QListWidget::item:hover { 
    background-color: #393c43; 
}
QListWidget::item:selected { 
    background-color: #5865f2; 
    color: white; 
    border: none;
    outline: none;
}
"""