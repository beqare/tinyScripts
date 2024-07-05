import os
import subprocess
import time
import importlib

output_path = "./src/output"
input_path = "./src/input"

libraries = [
    "turtle",
    "pytube",
    "subprocess",
    "os",
    "tkinter",
    "random",
    "spotdl",
    "json",
    "requests",
    "asyncio",
    "datetime",
    "statistics",
    "time",
    "beautifulsoup4"
]


def create_dirs():
    os.makedirs(output_path, exist_ok=True)
    os.makedirs(input_path, exist_ok=True)


def install_libs():
    missing_libs = []

    for lib in libraries:
        try:
            importlib.import_module(lib)
        except ImportError:
            missing_libs.append(lib)

    if missing_libs:
        try:
            subprocess.run(["pip", "install", *missing_libs], check=True)
            print(f"Libraries installed: {', '.join(missing_libs)}")
        except subprocess.CalledProcessError as e:
            print(f"Error during installation: {e}")


def clear_console():
    if os.name == "nt":
        os.system("cls")
    else:
        os.system("clear")


print("Setting up...")

create_dirs()
install_libs()

time.sleep(1)

clear_console()
