from PySide6.QtWidgets import (QWidget, QVBoxLayout, QHBoxLayout, QLineEdit,
                               QPushButton, QLabel, QTextEdit, QListWidget,
                               QFrame, QGraphicsDropShadowEffect)
from PySide6.QtCore import Qt, QSize
from PySide6.QtGui import QColor, QIcon

#UI Utility Functions

def apply_card_shadow(widget):
    """Applies a drop shadow effect to UI containers to create visual depth."""
    shadow = QGraphicsDropShadowEffect()
    shadow.setBlurRadius(30)
    shadow.setXOffset(0)
    shadow.setYOffset(10)
    shadow.setColor(QColor(0, 0, 0, 180))
    widget.setGraphicsEffect(shadow)

#Scene Definitions

class LoginSceneUI:
    """Handles the user authentication and initial connection interface."""
    @staticmethod
    def create(parent):
        page = QWidget()
        layout = QVBoxLayout(page)
        card = QFrame()
        card.setObjectName("Card")
        card.setFixedSize(450, 280)
        apply_card_shadow(card)

        cl = QVBoxLayout(card)
        cl.setContentsMargins(30, 30, 30, 30)
        cl.setSpacing(15)

        nick_input = QLineEdit()
        nick_input.setPlaceholderText("Twój nick...")
        btn = QPushButton("Login")

        cl.addWidget(QLabel("Podaj Twój Nick", alignment=Qt.AlignCenter))
        cl.addWidget(nick_input)
        cl.addWidget(btn)

        layout.addStretch()
        layout.addWidget(card, alignment=Qt.AlignCenter)
        layout.addStretch()
        return page, nick_input, btn


class SelectionSceneUI:
    """Interface for browsing, creating, and joining chat rooms."""
    @staticmethod
    def create(parent):
        page = QWidget()
        layout = QVBoxLayout(page)
        layout.setContentsMargins(40, 40, 40, 40)
        layout.setSpacing(20)

        h = QLabel("Dostępne pokoje")
        h.setAlignment(Qt.AlignCenter)
        h.setStyleSheet("font-weight: bold; font-size: 26px; color: white; margin-bottom: 10px;")

        btn_back_to_chat = QPushButton("← Return to active chat")
        btn_back_to_chat.setObjectName("Secondary")
        btn_back_to_chat.setVisible(False)

        card = QFrame()
        card.setObjectName("Card")
        apply_card_shadow(card)

        card_layout = QVBoxLayout(card)
        room_list = QListWidget()
        room_list.setFocusPolicy(Qt.NoFocus)
        card_layout.addWidget(room_list)

        btns_layout = QHBoxLayout()
        b_ref = QPushButton("Odśwież"); b_ref.setObjectName("Secondary"); b_ref.setFixedHeight(50)
        b_cre = QPushButton("Stwórz pokój"); b_cre.setObjectName("Tertiary"); b_cre.setFixedHeight(50)
        b_join = QPushButton("Dołącz"); b_join.setFixedHeight(50)

        btns_layout.addWidget(b_ref, stretch=1)
        btns_layout.addWidget(b_cre, stretch=1)
        btns_layout.addWidget(b_join, stretch=1)

        layout.addWidget(h)
        layout.addWidget(btn_back_to_chat)
        layout.addWidget(card, stretch=1)
        layout.addLayout(btns_layout)

        return page, room_list, btn_back_to_chat, b_ref, b_cre, b_join


class ChatSceneUI:
    """Main communication interface including messaging, user list, and admin tools."""
    @staticmethod
    def create(parent):
        page = QWidget()
        main_layout = QVBoxLayout(page)
        main_layout.setContentsMargins(20, 20, 20, 20)
        main_layout.setSpacing(15)

        # Header section for chat information and admin actions
        header = QHBoxLayout()
        chat_label = QLabel("Pokój: -")
        chat_label.setStyleSheet("font-weight: bold; font-size: 22px; color: white;")

        admin_widget = QWidget()
        al = QHBoxLayout(admin_widget)
        al.setContentsMargins(0, 0, 0, 0)
        al.setSpacing(10)

        b_ban = QPushButton()
        b_ban.setObjectName("Secondary")
        b_ban.setIcon(QIcon("ban.png"))
        b_ban.setIconSize(QSize(24, 24))
        b_ban.setFixedSize(50, 45)
        b_ban.setToolTip("Zbanuj użytkownika")

        b_rem = QPushButton()
        b_rem.setObjectName("Danger")
        b_rem.setIcon(QIcon("bin.png"))
        b_rem.setIconSize(QSize(24, 24))
        b_rem.setFixedSize(50, 45)
        b_rem.setToolTip("Usuń pokój")

        al.addWidget(b_ban); al.addWidget(b_rem)
        admin_widget.setVisible(False)

        header.addWidget(chat_label); header.addStretch(); header.addWidget(admin_widget)
        main_layout.addLayout(header)

        # Body section with sidebar (user list) and main chat area
        body = QHBoxLayout(); body.setSpacing(15)

        user_card = QFrame(); user_card.setObjectName("Card")
        u_layout = QVBoxLayout(user_card)
        u_label = QLabel("Użytkownicy"); u_label.setStyleSheet("font-weight: bold; color: #72767d;")
        user_list_widget = QListWidget()
        user_list_widget.setFocusPolicy(Qt.NoFocus)
        user_list_widget.setFixedWidth(240)
        u_layout.addWidget(u_label); u_layout.addWidget(user_list_widget)

        chat_card = QFrame(); chat_card.setObjectName("Card")
        c_layout = QVBoxLayout(chat_card)
        chat_display = QTextEdit(); chat_display.setReadOnly(True)
        c_layout.addWidget(chat_display)

        body.addWidget(user_card, stretch=0)
        body.addWidget(chat_card, stretch=1)
        main_layout.addLayout(body)

        # Bottom control panel for message input and navigation
        input_area = QHBoxLayout(); input_area.setSpacing(10)
        msg_input = QLineEdit()
        msg_input.setPlaceholderText("Napisz wiadomość...")
        msg_input.setFixedHeight(50)

        b_send = QPushButton(); b_send.setObjectName("Tertiary"); b_send.setFixedSize(60, 50)
        b_send.setIcon(QIcon("send.png"))
        b_send.setIconSize(QSize(26, 26))
        b_send.setToolTip("Wyślij wiadomość")

        b_menu = QPushButton("Menu"); b_menu.setObjectName("Secondary")
        b_menu.setFixedHeight(50)
        b_menu.setMinimumWidth(110)

        b_leave = QPushButton(); b_leave.setObjectName("Danger");
        b_leave.setFixedSize(60, 50)
        b_leave.setIcon(QIcon("exit.png"));
        b_leave.setIconSize(QSize(26, 26))
        b_leave.setToolTip("Opuść pokój")

        input_area.addWidget(msg_input);
        input_area.addWidget(b_send); input_area.addWidget(b_menu)
        input_area.addWidget(b_leave)
        main_layout.addLayout(input_area)

        return (page, chat_display, msg_input, chat_label, admin_widget,
                user_list_widget, b_send, b_menu, b_leave, b_ban, b_rem)