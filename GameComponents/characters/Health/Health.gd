extends Node
class_name Health

signal health_changed(value)
@export var max_health: int:
	set(value):
		max_health = value
		health_changed.emit(value)
var health: int:
	set(value):
		health = clamp(value, 0, max_health)
		health_changed.emit(health)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_deferred("health", max_health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_health(damage=0):
	if damage:
		health = health - damage
		if health <= 0: 
			print('Lethal damage taken!')
			get_parent().state.death()
		print('damage taken, health is now ', health)
	else: 
		print('Update with no damage')
