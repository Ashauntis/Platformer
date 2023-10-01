extends Label

@onready var rabbit = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("")
	update_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_label()
	
func update_label():
	set_text(str(rabbit.velocity.x))
