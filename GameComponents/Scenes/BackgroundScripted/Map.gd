extends Node2D

@onready var globals = get_node("/root/WorldVariables")

@export var bg: Sprite2D
@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var bgscale = bg.get_scale()
	var height = bg.texture.get_height() * bgscale.y
	print('height ', height)
	var width = bg.texture.get_width() * bgscale.x
	print('width ', width)
	
	globals.update_boundaries(height, width)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
