extends Node
class_name State

signal Transitioned

@onready var target: CharacterBody2D
@onready var dirx: float

# Called when the node enters the scene tree for the first time.
func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass
	
func flip_sprite(sprite: AnimatedSprite2D, dirx: float):
	if (dirx > 0):
		sprite.set_flip_h(false)
	elif (dirx < 0):
		sprite.set_flip_h(true)
