extends State
class_name CharacterRun

@onready var entity = get_parent().entity

func Enter():
	flip_sprite(entity.sprite, entity.dirx)
	entity.sprite.play("run")
	
func Update(_delta: float):
	flip_sprite(entity.sprite, entity.dirx)

func Physics_Update(_delta: float):
	if entity.dirx:
		entity.velocity.x = entity.dirx * entity.SPEED
	else:
		Transitioned.emit(self, "idle")
