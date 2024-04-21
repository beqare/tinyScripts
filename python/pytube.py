from pytube import YouTube

url = input("YouTube link: ")

yt = YouTube(url)

video_stream = yt.streams.get_highest_resolution()

print("Downloading...")
video_stream.download(output_path="./")

print("Download finished.")
