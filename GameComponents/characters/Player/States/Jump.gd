extends State
class_name CharacterJump

@onready var entity = get_parent().entity

func Enter():
	flip_sprite(entity.sprite, entity.dirx)
	entity.sprite.play("jump")
	
func Update(_delta: float):
	# Handle jump
	if Input.is_action_just_pressed("jump") and entity.is_on_floor():
		Transitioned.emit(self, "jump")
	# if we have a horizontal input, handle it
	if entity.dirx:
		Transitioned.emit(self, "run")

func Exit(): 
	pass

func Physics_Update(_delta: float):
	pass

