extends Node

func _ready():
	Events.changeScene.connect(_on_change_scene)

func _on_change_scene(sceneName:String):
	match sceneName:
		"intro":
			get_tree().change_scene_to_file(
				"res://scenes/IntroScene.tscn"
			)
		"main":
			get_tree().change_scene_to_file(
				"res://scenes/main_scene.tscn"
				)
		"outro":
			get_tree().change_scene_to_file(
				"res://scenes/OutroScene.tscn"
				)
