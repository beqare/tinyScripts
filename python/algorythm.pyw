import turtle
import subprocess
import os

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main

window = turtle.Screen()
window.title("@snoopti")
window.bgcolor("black")
window.setup(width=800, height=400)

block = turtle.Turtle()
block.shape("square")
block.color("blue")
block.penup()
block.speed(0)

speed = 5
direction = 1

window_width = window.window_width()


def move_block():
    global speed, direction

    new_x = block.xcor() + (speed * direction)

    if abs(block.xcor()) < speed and direction == 1:
        speed += 5

    if new_x > (window_width / 2) - 10 or new_x < -(window_width / 2) + 10:
        direction *= -1

    block.setx(new_x)

    turtle.ontimer(move_block, 6)


move_block()

turtle.mainloop()
