extends Node2D

@export var aspectRatioTiming : int
@export var waitTime : int

func _ready():
	Events.activateDress.emit(1)
	Events.activateDress.connect(_on_last_dress)
	
func _on_last_dress(dressNum:int):
	if dressNum == 7:
		var tween = create_tween()
		tween.tween_property(
			$PointLight2D, 
			"texture_scale", 
			2.2, 
			aspectRatioTiming
			)
		tween.tween_interval(
			waitTime
			)
		tween.tween_callback(
			func(): Events.changeScene.emit("outro")
			)
