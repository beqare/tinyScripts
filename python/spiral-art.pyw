import turtle
import subprocess
import os

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main

col = ["darkred", "red"]

t = turtle.Turtle()
screen = turtle.Screen()
screen.bgcolor("black")
t.speed(100)

for i in range(1000):
    t.color(col[i % 2])
    t.forward(i * 8)
    t.left(150)
    t.width(4)
