extends Area2D

func _ready():
	input_event.connect(_on_knob_click)

func _on_knob_click(viewport:Node, event:InputEvent, shape_idx:int):
	if event.is_action_pressed("mouse_click"):
		Events.changeScene.emit("main")
