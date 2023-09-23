extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D

@onready var all_interactions = []
@onready var interactLabel = $"Interaction Components/InteractionLabel"
signal interaction_occured(label, type, value)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	update_interactions()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("interact"):
		execute_interactions()

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		# move in the selected direction
		velocity.x = direction * SPEED
		
		# set the sprite direction based on the input direction
		if (velocity.x > 0):
			sprite.set_flip_h(false)
		elif (velocity.x < 0):
			sprite.set_flip_h(true)		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animations()
	move_and_slide()

func update_animations():
	if ap.current_animation == "land":
		if (ap.playback_active) and (velocity.y == 0): return		
	if velocity.y < 0: 
		ap.play("jump")
	elif velocity.y > 0: 
		ap.play("fall")
	elif velocity.y == 0 and (ap.current_animation == "fall"):
		ap.play("land")
	elif velocity.x == 0:
		ap.play("idle")
	else:
		ap.play("run")

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
