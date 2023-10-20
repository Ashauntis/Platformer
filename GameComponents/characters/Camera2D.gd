extends Camera2D

@onready var globals = get_node("/root/WorldVariables")

@export var label: Label
@export var label2: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	globals.boundary_changed.connect(set_camera_limits)
	set_camera_limits(globals.world_width, globals.world_height) 
	label.text = ""
	label2.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_label()
	
	
func set_camera_limits(width, height, offsetx = 0, offsety = 0):
	self.limit_top = 0 + offsety
	self.limit_left = 0 + offsetx
	self.limit_bottom = height + offsety
	self.limit_right = width + offsetx


func update_label():
	var location = get_target_position()
	var camLoc ="Camera Target: " + str(int(location.x)) + ", " + str(int(location.y))
	#var camlimits = "top: " + str(self.limit_top) + ', ' + "right: " + str(self.limit_right) + ', ' + "bottom: " + str(self.limit_bottom) + ', ' + "left: " + str(self.limit_left)
	label.text = camLoc
	#label2.text = camlimits 
	
