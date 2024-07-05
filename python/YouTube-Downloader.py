from pytube import YouTube
import subprocess
import os

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main
url = input("YouTube-Link: ")

yt = YouTube(url)

video_stream = yt.streams.get_highest_resolution()

print("Downloading...")
video_stream.download(output_path)

print("Downlaoded.")
