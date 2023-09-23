extends Area2D

@onready var ap = get_node('../../../InteractArea/AudioStreamPlayer2D')

# Called when the node enters the scene tree for the first time.
func _ready():
	#load any resources we need for our interactionse
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _handle_interaction(interaction):
	match interaction.interact_type: 
		"test": 
			print(interaction.interact_value)
		"open":
			var chest_audio = load('res://Assets/Audio/squeaky-door-open-113212.mp3')
			ap.stream = chest_audio
			ap.play()
			print("Chest opened!")
		_:
			print("Interaction not found")
