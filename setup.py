import os
import subprocess

def create_directories():
    if not os.path.exists("./src/output"):
        os.makedirs("./src/output")
    if not os.path.exists("./src/input"):
        os.makedirs("./src/input")

def install_libraries():
    try:
        subprocess.run(["pip", "install", "turtle", "pytube", "subprocess", "os", "tkinter", "random"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Fail: {e}")
        return

install_libraries()

create_directories()
