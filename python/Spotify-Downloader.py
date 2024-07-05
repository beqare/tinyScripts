import subprocess
import os

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main
def run_spotdl(url):
    os.chdir(output_path)
    subprocess.run(["spotdl", url])


def main():

    while True:
        url = input("Song-URL: ")
        if url.lower() == "exit":
            break
        run_spotdl(url)


if __name__ == "__main__":
    main()
