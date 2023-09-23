extends Node2D

### THIS SCRIPT IS CONFIGURED TO AUTOLOAD INTO THE SCENE TREE. 
### IT CAN BE EXPORTED INTO ANY FILE WITH @onready audio = get_node("/root/AudioHandler")
### AND IT'S METHODS USED LIKE SO - audio.play_audio("key")

# number of audio players to instantiate on load
var PLAYER_COUNT = 5

# dictionary to store nodes
var audio_players = {}
var audio_resources = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# create our pre-defined number of audio players for use
	for i in range(PLAYER_COUNT): 
		var player = AudioStreamPlayer.new()
		add_child(player)
		audio_players["player" + str(i)] = player
		
	# load and store any audio streams we want available in the game
	load_audio_stream("open", "res://assets/audio/squeaky-door-open-113212.mp3")
	load_audio_stream("bg", "res://assets/audio/bg-out-of-time.mp3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Methods to handle audio
func load_audio_stream(key, path):
	audio_resources[key] = load(path)
	
func get_audio_player(player_name):
	return audio_players.get(player_name, null)
	
func get_available_player():
	for player in audio_players: 
		if audio_players[player].playing:
			pass
		else:
			return audio_players[player]
	
func get_audio_stream(stream_key):
	return audio_resources.get(stream_key, null)
	
func play_audio(stream_key, player_name="none"):
	var audio_stream = get_audio_stream(stream_key)
	var player
	
	# are we changing what's playing on a specific player?
	if player_name == "none":
		player = get_available_player()
		print("got available player: ", player)
	else:
		player = get_audio_player(player_name)
		print("selected player ", player)
		
	if player and audio_stream:
		player.stream = audio_stream
		player.play()
	
