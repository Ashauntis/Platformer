extends State
class_name CharacterIdle

@onready var entity = get_parent().entity

func Enter():
	entity.sprite.play("idle")
	
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

