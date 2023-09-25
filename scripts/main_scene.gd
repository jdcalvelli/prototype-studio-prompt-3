extends Node2D

func _ready():
	Events.activateDress.emit(1)
	Events.activateDress.connect(_on_last_dress)
	
func _on_last_dress(dressNum:int):
	if dressNum == 7:
		print("TEST")
