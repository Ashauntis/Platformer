extends Node

# Set up world bounds
var world_height: int = 0
var world_width: int = 0

signal health_changed(value)
var max_health: int:
	set(value):
		max_health = value
		print("Emitting %s health on max_health change" % [max_health])
		health_changed.emit(value)
var health: int:
	set(value):
		health = clamp(value, 0, max_health)
		print("Emitting %s health on health change" % [health])
		health_changed.emit(health)
	get:
		return health

signal boundary_changed(height, width, tile_size)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update_health(damage=0):
	if damage:
		health = health - damage
		print('damage taken, health is now ', health)
	else: 
		print('Update with no damage')
	
func update_boundaries(height, width):
	world_height = height
	world_width = width
	#print('Set world boundaries to ', world_height, 'x', world_width)
	boundary_changed.emit(world_height, world_width)
	
