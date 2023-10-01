extends Node2D


@export var MAX_HEALTH: int
var health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func damage(attack: Attack):
	health -= attack.attack_damage

	if health <= 0:
		get_parent().queue_free()
