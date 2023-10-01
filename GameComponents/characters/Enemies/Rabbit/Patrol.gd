extends State
class_name Patrol

@onready var entity = get_parent().entity
# time to traverse the path in seconds
@export var path_time := 5.0

var direction : int = -1

# variables for easier referencing to direction
const left = -1 
const right = 1

func Enter():
	pass
	
func Update(_delta: float):
	pass
		
func Physics_Update(delta: float):
	var position = entity.path.get_progress_ratio()
	
	# logic for left
	if direction == -1:
		if position < 1:
			entity.get_node('AnimatedSprite2D').play("MoveLeft")
			entity.path.set_progress_ratio(position + (path_time / 20) * delta)
		else: direction = 1
	# and then for right
	else:
		if position > 0:
			entity.get_node('AnimatedSprite2D').play("MoveRight")
			entity.path.set_progress_ratio(position - (path_time / 20) * delta)
		else: direction = -1
