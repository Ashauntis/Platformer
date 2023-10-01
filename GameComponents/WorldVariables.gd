extends Node

# Set up world bounds
var world_height: int = 0
var world_width: int = 0

signal boundary_changed(height, width, tile_size)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func update_boundaries(height, width):
	world_height = height
	world_width = width
	print('Set world boundaries to ', world_height, 'x', world_width)
	boundary_changed.emit(world_height, world_width)
	
