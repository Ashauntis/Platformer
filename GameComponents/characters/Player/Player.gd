extends CharacterBody2D

@onready var globals = get_node("/root/WorldVariables")

@export var SPEED: int = 300
@export var JUMP_VELOCITY: int = -300
@export var state: StateMachine
@export var health: Health

@export var sprite: AnimatedSprite2D

@export var interactLabel: Label
@onready var all_interactions = []
signal interaction_occured(label, type, value)

# track the input for this character
@onready var dirx: float = 0
@onready var diry: float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#globals.max_health = max_health
	# defer setting this value so the UI has a chance to connect to our signal first
	#set_deferred("health", max_health)
	pass
	
func _process(_float) -> void:
	pass
	
func _physics_process(delta):
	# include any not-state specific physics instructions
	
	# Get the directional input values
	dirx = Input.get_axis("left", "right")
	diry = Input.get_axis("up", "down")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if not(dirx or diry):
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle Interactions
	if Input.is_action_just_pressed("interact"):
		execute_interactions()

	move_and_slide()

# Interaction Methods
###################################

func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area)
	update_interactions()

func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

# update the label to show interaction state	
func update_interactions():
		if all_interactions:
			interactLabel.text = all_interactions[0].interact_label
		else:
			interactLabel.text = ""
	
func execute_interactions():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		print(cur_interaction)
		emit_signal("interaction_occured", cur_interaction)
