import subprocess
import os

subprocess.run(["python", "../setup.py"])

def run_spotdl(url):
    os.chdir("./src/output")
    subprocess.run(["spotdl", url])


def main():

    while True:
        url = input("Song-URL: ")

        if url.lower() == "exit":
            break

        run_spotdl(url)


if __name__ == "__main__":
    main()
