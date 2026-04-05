import socket
import threading

# Core networking logic for IRC server communication
class IRCCore:
    def __init__(self, host, port, on_message_callback):
        """Initializes socket parameters and data buffers."""
        self.host = host
        self.port = port
        self.on_message = on_message_callback
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.running = False
        self.recv_buffer = ""

    def connect(self, username):
        """Establishes a connection to the host and starts the background listener thread."""
        try:
            self.sock.connect((self.host, self.port))
            self.running = True
            self.send_raw(username)
            threading.Thread(target=self._recv_loop, daemon=True).start()
            return True
        except:
            return False

    def send_raw(self, text):
        """Encodes and transmits raw text data to the connected server."""
        if self.running:
            try:
                self.sock.sendall((text + "\n").encode())
            except:
                self.running = False

    def _recv_loop(self):
        """Continuously monitors the socket for incoming data and handles packet fragmentation."""
        while self.running:
            try:
                data = self.sock.recv(4096)
                if not data: break

                self.recv_buffer += data.decode()

                while "\n" in self.recv_buffer:
                    line, self.recv_buffer = self.recv_buffer.split("\n", 1)
                    self.on_message(line)
            except:
                break
        self.running = False