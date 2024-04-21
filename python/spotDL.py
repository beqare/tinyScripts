import subprocess
import os


def run_spotdl(url):
    os.chdir("../src/download")
    subprocess.run(["spotdl", url])


def main():
    if not os.path.exists("../src/download"):
        os.makedirs("../src/download")

    while True:
        url = input("Song-URL: ")

        if url.lower() == "exit":
            break

        run_spotdl(url)
        print("finish")


if __name__ == "__main__":
    main()
