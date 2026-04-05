import socket
import threading
import sys

HOST = "192.168.56.101"
PORT = 1234

def recv_loop(sock):
    while True:
        data = sock.recv(4096)
        if not data:
            break
        print(data.decode(), end="")

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))


threading.Thread(target=recv_loop, args=(s,), daemon=True).start()

try:
    while True:
        line = sys.stdin.readline()
        if not line:
            break
        s.sendall(line.encode())
except KeyboardInterrupt:
    pass

s.close()