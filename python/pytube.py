from pytube import YouTube
import subprocess
import os

subprocess.run(["python", "../setup.py"])

url = input("YouTube-Link: ")

yt = YouTube(url)

video_stream = yt.streams.get_highest_resolution()

print("Herunterladen...")
video_stream.download(output_path="../src/download/")

print("Download abgeschlossen.")
