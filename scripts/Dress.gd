extends Sprite2D

@export var thisDressNum:int

var isHeld:bool
var emitOnce:bool = false

func _ready():
	$Area2D.input_event.connect(_on_dress_click)
	
	Events.activateDress.connect(_on_activate_dress)

func _physics_process(delta):
	if isHeld:
		position.x = lerp(
			position.x,
			clamp(
				get_global_mouse_position().x, 
				-132.0, 
				70.0
				),
			10 * delta
		)
		
	if !isHeld and position.x <= -120:
		$Area2D.input_pickable = false
		if !emitOnce:
			print("emit once")
			Events.activateDress.emit(thisDressNum + 1)
			emitOnce = true
	# print(get_global_mouse_position())

func _on_dress_click(viewport:Node, event:InputEvent, shape_idx:int):
	if event.is_action_pressed("mouse_click"):
		isHeld = !isHeld
		
func _on_activate_dress(dressNum:int):
	if dressNum == thisDressNum:
		$Area2D.input_pickable = true
	else:
		$Area2D.input_pickable = false
