extends TextureProgressBar

@onready var globals = get_node("/root/WorldVariables")
@onready var hp = get_parent().player.health

# Called when the node enters the scene tree for the first time.
func _ready():
	min_value = 0
	max_value = hp.max_health
	hp.health_changed.connect(update_element)
	update_element(globals.max_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func update_element(health):
	value = health
	#print('updated hp bar value to ', self.value)
