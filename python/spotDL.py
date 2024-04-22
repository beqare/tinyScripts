import subprocess
import os


def run_spotdl(url):
    os.chdir("../src/output")
    subprocess.run(["spotdl", url])


def main():
    if not os.path.exists("../src/output"):
        os.makedirs("../src/output")

    while True:
        url = input("Song-URL: ")

        if url.lower() == "exit":
            break

        run_spotdl(url)


if __name__ == "__main__":
    main()
