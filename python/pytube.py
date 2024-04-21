from pytube import YouTube

url = input("YouTube-Link: ")

yt = YouTube(url)

video_stream = yt.streams.get_highest_resolution()

print("Herunterladen...")
video_stream.download(output_path="../src/download/")

print("Download abgeschlossen.")
