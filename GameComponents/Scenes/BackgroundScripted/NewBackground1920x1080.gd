extends Sprite2D

@onready var globals = get_node("/root/WorldVariables")

# Called when the node enters the scene tree for the first time.
func _ready():
	globals.update_boundaries(texture.get_width(), texture.get_height())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
