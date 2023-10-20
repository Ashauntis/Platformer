extends State
class_name CharacterDeath

@onready var globals = get_node("/root/WorldVariables")

@onready var entity = get_parent().entity

func Enter():
	print('Playing death animation')
	entity.sprite.play("death")
	
func Update(_delta: float):
	pass

func Exit(): 
	pass

func Physics_Update(_delta: float):
	pass
