extends State
class_name CharacterFalling

@onready var entity = get_parent().entity

func Enter():
	entity.sprite.play("fall")
	
func Update(_delta: float):
	pass

func Exit(): 
	pass

func Physics_Update(_delta: float):
	move_x()
	if entity.is_on_floor():
		if entity.dirx:
			Transitioned.emit(self, "run")
		else: 
			Transitioned.emit(self, "idle")

