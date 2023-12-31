extends State
class_name CharacterJump

@onready var globals = get_node("/root/WorldVariables")

@onready var entity = get_parent().entity

func Enter():
	flip_sprite()
	entity.sprite.play("jump")
	jump()
	
func Update(_delta: float):
	if entity.velocity.y < 0:
		Transitioned.emit(self, "falling")

func Exit(): 
	pass

func Physics_Update(_delta: float):
	if entity.dirx:
		flip_sprite()
		move_x()
