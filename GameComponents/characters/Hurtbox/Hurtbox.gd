extends Node2D

@export var health_component: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)

func _on_area_entered(area):
	pass # Replace with function body.

