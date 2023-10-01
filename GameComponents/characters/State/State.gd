extends Node
class_name State

signal Transitioned

@export var aSprite: AnimatedSprite2D
@export var target: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass
	
func flip_sprite():
	if (target.dirx > 0):
		aSprite.set_flip_h(false)
	elif (target.dirx < 0):
		aSprite.set_flip_h(true)
		
func move_x():
	if target.dirx:
		target.velocity.x = target.dirx * target.SPEED

func jump():
	target.velocity.y = target.JUMP_VELOCITY
