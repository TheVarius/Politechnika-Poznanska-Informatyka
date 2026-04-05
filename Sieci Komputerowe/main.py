import sys

from PySide6.QtGui import QIcon
from PySide6.QtWidgets import (QApplication, QMainWindow, QStackedWidget,
                               QInputDialog, QMessageBox, QDialog, QVBoxLayout,
                               QLabel, QListWidget, QPushButton, QLineEdit)
from PySide6.QtCore import Qt, Signal, QObject
from irc_core import IRCCore
from gui_style import LoginSceneUI, SelectionSceneUI, ChatSceneUI
from style_sheet import STYLE_SHEET

#Networking and Communication Bridge

class Communicate(QObject):
    message_received = Signal(str)

class IRCCoreQt(IRCCore):
    """Integrates the IRC core logic with Qt's signal-slot system."""
    def __init__(self, host, port):
        self.comm = Communicate()
        super().__init__(host, port, self.comm.message_received.emit)
        self.expecting_rooms = False
        self.username = ""

#Main Application Controller

class IRCApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowIcon(QIcon("app_icon.png"))
        self.setWindowTitle("Komunikator IRC")
        self.resize(1100, 700)
        self.setStyleSheet(STYLE_SHEET)

        self.active_room = None
        self.pending_room = None
        self.current_room_users = []

        self.core = IRCCoreQt("172.19.120.222", 1234)
        self.core.comm.message_received.connect(self.handle_incoming_message)

        self.stack = QStackedWidget()
        self.setCentralWidget(self.stack)

        self._init_ui()

    def _init_ui(self):
        """Initializes all UI scenes and maps their signals to application logic."""
        login_page, self.nick_input, btn_login = LoginSceneUI.create(self)
        self.nick_input.returnPressed.connect(self.on_login)
        btn_login.clicked.connect(self.on_login)
        self.stack.addWidget(login_page)

        (selection_page, self.room_list, self.btn_back_to_chat,
         b_ref, b_cre, b_join) = SelectionSceneUI.create(self)
        b_ref.clicked.connect(self.refresh_rooms)
        b_cre.clicked.connect(self.on_create)
        b_join.clicked.connect(self.on_join)
        self.btn_back_to_chat.clicked.connect(self.return_to_chat)
        self.stack.addWidget(selection_page)

        (chat_page, self.chat_display, self.msg_input, self.chat_label,
         self.admin_widget, self.user_list_widget, b_send, b_menu,
         b_leave, b_ban, b_rem) = ChatSceneUI.create(self)
        self.msg_input.returnPressed.connect(self.send_msg)
        b_send.clicked.connect(self.send_msg)
        b_menu.clicked.connect(self.go_to_menu)
        b_leave.clicked.connect(self.leave_room)
        b_ban.clicked.connect(self.on_ban_user)
        b_rem.clicked.connect(self.on_remove_room)
        self.stack.addWidget(chat_page)

    #Server Message Processing

    def handle_incoming_message(self, text):
        """Parses incoming server strings and updates the UI state accordingly."""
        lines = text.strip().split('\n')
        for line in lines:
            line = line.strip()
            if not line: continue

            if "ROOM_DELETED" in line:
                QMessageBox.information(self, "Pokój usunięty", "Ten pokój został usunięty.")
                self.active_room = None
                self.btn_back_to_chat.setVisible(False)
                self.stack.setCurrentIndex(1)
                self.refresh_rooms()
                continue

            if "KICKED_BANNED" in line:
                QMessageBox.critical(self, "Ban", "Zostałeś zbanowany!")
                self.leave_room()
                continue

            if "START_USER_LIST" in line:
                self.user_list_widget.clear()
                self.current_room_users = []
                continue

            if "USER_IN_ROOM:" in line:
                uname = line.replace("USER_IN_ROOM:", "").strip()
                self.current_room_users.append(uname)
                self.user_list_widget.addItem(uname)
                continue

            if "ERROR: Wrong password" in line:
                msg = QMessageBox(self)
                msg.setIcon(QMessageBox.Warning)
                msg.setWindowTitle("Błąd")
                msg.setText("Błędne hasło!")

                ok_button = msg.addButton("OK", QMessageBox.AcceptRole)
                ok_button.setObjectName("DialogOk")

                ok_button.style().unpolish(ok_button)
                ok_button.style().polish(ok_button)

                msg.exec()
                continue

            if "OWNER_STATUS:" in line:
                self.admin_widget.setVisible("1" in line)
                continue

            if "JOIN_SUCCESS" in line or "Room created and joined" in line:
                if self.pending_room:
                    self.enter_chat_mode(self.pending_room)
                    self.pending_room = None
                continue

            ignored = ["Welcome", "/help", "Not in any room", "OWNER_STATUS", "START_USER_LIST", "USER_IN_ROOM", "END_USER_LIST", "ROOM_DELETED"]

            if self.core.expecting_rooms and ":" not in line:
                if not any(msg in line for msg in ignored):
                    self.room_list.addItem(line)
            else:
                if ":" in line and not any(tag in line for tag in ignored):
                    self.chat_display.append(line)

    #Room and Connection Management

    def on_login(self):
        """Establishes connection to the server using the provided nickname."""
        nick = self.nick_input.text().strip()
        if nick and self.core.connect(nick):
            self.core.username = nick
            self.refresh_rooms()
            self.stack.setCurrentIndex(1)

    def refresh_rooms(self):
        """Requests the current list of available rooms from the server."""
        self.core.expecting_rooms = True
        self.room_list.clear()
        self.core.send_raw("/rooms")

    def on_create(self):
        """Handles the creation of a new chat room with optional password protection."""
        dlg = QInputDialog(self)
        dlg.setWindowTitle("Nowy Pokój")
        dlg.setLabelText("Nazwa pokoju:")
        dlg.setOkButtonText("OK")
        dlg.setCancelButtonText("Wróć")

        for btn in dlg.findChildren(QPushButton):
            if "OK" in btn.text():
                btn.setObjectName("DialogOk")
            elif "Wróć" in btn.text():
                btn.setObjectName("DialogCancel")

            btn.style().unpolish(btn)
            btn.style().polish(btn)

        if dlg.exec():
            name = dlg.textValue().strip()
            if name:
                pwd_dlg = QInputDialog(self)
                pwd_dlg.setWindowTitle("Hasło")
                pwd_dlg.setLabelText("Hasło (opcjonalnie):")
                pwd_dlg.setTextEchoMode(QLineEdit.Password)
                pwd_dlg.setOkButtonText("OK")
                pwd_dlg.setCancelButtonText("Wróć")

                for btn in pwd_dlg.findChildren(QPushButton):
                    if "OK" in btn.text():
                        btn.setObjectName("DialogOk")
                    elif "Wróć" in btn.text():
                        btn.setObjectName("DialogCancel")
                    btn.style().unpolish(btn)
                    btn.style().polish(btn)

                if pwd_dlg.exec():
                    pwd = pwd_dlg.textValue()
                    self.pending_room = name
                    self.core.send_raw(f"/create {name} {pwd}" if pwd else f"/create {name}")

    def on_join(self):
        """Processes a request to join a selected room from the room list."""
        item = self.room_list.currentItem()
        if item:
            name = item.text().split(" ")[0]
            dlg = QInputDialog(self)
            dlg.setWindowTitle("Hasło")
            dlg.setLabelText(f"Podaj hasło dla {name}:")
            dlg.setTextEchoMode(QLineEdit.Password)
            dlg.setOkButtonText("OK")
            dlg.setCancelButtonText("Wróć")

            for btn in dlg.findChildren(QPushButton):
                if "OK" in btn.text():
                    btn.setObjectName("DialogOk")
                elif "Wróć" in btn.text():
                    btn.setObjectName("DialogCancel")
                btn.style().unpolish(btn)
                btn.style().polish(btn)

            if dlg.exec():
                pwd = dlg.textValue()
                self.pending_room = name
                self.core.send_raw(f"/join {name} {pwd}" if pwd else f"/join {name}")

    #Moderation and Chat Navigation

    def on_ban_user(self):
        """Opens a moderation dialog to ban a selected user from the current room."""
        dialog = QDialog(self)
        dialog.setWindowTitle("Wybierz kogo zbanować")
        layout = QVBoxLayout(dialog)
        lw = QListWidget()
        for u in self.current_room_users:
            if u != self.core.username: lw.addItem(u)

        btn = QPushButton("Zbanuj")
        btn.setObjectName("Danger")

        btn.clicked.connect(lambda: [self.core.send_raw(f"/ban {self.active_room} {lw.currentItem().text()}"),
                                     dialog.accept()] if lw.currentItem() else None)
        layout.addWidget(lw)
        layout.addWidget(btn)
        dialog.exec()

    def enter_chat_mode(self, name):
        """Switches the interface to the active chat session view."""
        self.active_room = name
        self.core.expecting_rooms = False
        self.chat_display.clear()
        self.chat_label.setText(f"Pokój: {name}")
        self.btn_back_to_chat.setVisible(False)
        self.stack.setCurrentIndex(2)

    def go_to_menu(self):
        """Navigates back to the room selection menu while keeping the chat active."""
        if self.active_room:
            self.btn_back_to_chat.setText(f"Powrót do czatu: {self.active_room}")
            self.btn_back_to_chat.setVisible(True)
        self.refresh_rooms()
        self.stack.setCurrentIndex(1)

    def return_to_chat(self):
        """Restores the view to the currently active chat session."""
        self.btn_back_to_chat.setVisible(False)
        self.core.expecting_rooms = False
        self.stack.setCurrentIndex(2)

    def leave_room(self):
        """Disconnects from the current room and returns to the main menu."""
        self.core.send_raw("/leave")
        self.active_room = None
        self.btn_back_to_chat.setVisible(False)
        self.admin_widget.setVisible(False)
        self.refresh_rooms()
        self.stack.setCurrentIndex(1)

    def on_remove_room(self):
        """Sends a request to the server to delete the current room."""
        if self.active_room: self.core.send_raw(f"/remove {self.active_room}")

    def send_msg(self):
        """Handles the sending of chat messages to the server."""
        txt = self.msg_input.text().strip()
        if txt:
            self.core.send_raw(txt)
            self.msg_input.clear()



if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = IRCApp()
    window.show()
    sys.exit(app.exec())