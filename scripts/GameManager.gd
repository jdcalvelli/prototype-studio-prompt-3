extends Node

func _ready():
	Events.changeScene.connect(_on_change_scene)

func _on_change_scene(sceneName:String):
	match sceneName:
		"main":
			get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
