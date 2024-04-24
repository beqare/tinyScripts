import turtle
import subprocess
import os

subprocess.run(["python", "../setup.py"])

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
