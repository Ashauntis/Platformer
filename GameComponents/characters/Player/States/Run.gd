extends State
class_name CharacterRun

@onready var entity = get_parent().entity

func Enter():
	flip_sprite()
	entity.sprite.play("run")
	
func Update(_delta: float):
	if Input.is_action_just_pressed("jump") and entity.is_on_floor():
		Transitioned.emit(self, "jump")
	pass

func Physics_Update(_delta: float):
	if entity.dirx:
		flip_sprite()
		move_x()
	else:
		Transitioned.emit(self, "idle")
