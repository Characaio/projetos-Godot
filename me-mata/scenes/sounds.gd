extends Node

@onready var music: AudioStreamPlayer = $music

func play():
	music.play()
	
