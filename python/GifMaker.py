import os
from moviepy.editor import VideoFileClip
import tkinter as tk
from tkinter import simpledialog, messagebox

defaultFps = 24
defaultSpeed = 2.0


def mp4_to_gif(mp4_file, gif_file, fps=defaultFps, speed=defaultSpeed):
    try:
        if not os.path.exists(mp4_file):
            messagebox.showerror("Error", f"File {mp4_file} not found!")
            return
        if fps <= 0:
            messagebox.showerror("Error", "FPS must be higher than 0!")
            return
        if speed <= 0:
            messagebox.showerror("Error", "Speed must be higher than 0!")
            return
        clip = VideoFileClip(mp4_file)
        clip = clip.speedx(speed)
        clip.write_gif(gif_file, fps=fps)
        messagebox.showinfo("Success", f"{mp4_file} finished converted {gif_file}.")
    except Exception as e:
        messagebox.showerror("Error", f"Error by converting {mp4_file} to GIF: {e}")


mp4_dir = "../src/input/"
gif_dir = "../src/output/"

mp4_files = [
    os.path.join(mp4_dir, file) for file in os.listdir(mp4_dir) if file.endswith(".mp4")
]

if not mp4_files:
    messagebox.showerror(f"Error", f"No Mp4 File found in {mp4_dir}.")
    exit()

root = tk.Tk()
root.withdraw()

fps = simpledialog.askfloat(
    "FPS",
    f"FPS: (Standard: {defaultFps}):",
    initialvalue=defaultFps,
)
speed = simpledialog.askfloat(
    "VideoSpeed",
    f"Speed: (Default: {defaultSpeed}):",
    initialvalue=defaultSpeed,
)

for mp4_file in mp4_files:
    file_name = os.path.splitext(os.path.basename(mp4_file))[0]
    gif_file = os.path.join(gif_dir, file_name + ".gif")
    mp4_to_gif(mp4_file, gif_file, fps=fps, speed=speed)
