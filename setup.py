import os
import time
import subprocess

output = "./src/output"
input = "./src/input"

libraries = ["turtle", "pytube", "subprocess", "os", "tkinter", "random"]


def create_directories():
    if not os.path.exists(output):
        os.makedirs(output)

    if not os.path.exists(input):
        os.makedirs(input)


def install_libraries():
    try:
        subprocess.run(["pip", "install", *libraries], check=True)
        print("libraries installed")
    except subprocess.CalledProcessError as e:
        print(f"Fail to install library: {e}")
        return


print("")
print("Creating directories...")
print("")

create_directories()

print("created...")

time.sleep(1)

print("")
print("Installing libraries...")
print("")

install_libraries()

print("installed")
