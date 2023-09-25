extends Node2D

var canRestart:bool = false

func _ready():
	var tween = create_tween()
	tween.tween_property(
		$Control,
		"modulate",
		Color(Color.BLACK, 1),
		3
	)
	tween.tween_callback(
		func():
			canRestart = true
	)
	
func _input(event):
	if event.is_action_pressed("r_button") and canRestart:
		Events.changeScene.emit("intro")
