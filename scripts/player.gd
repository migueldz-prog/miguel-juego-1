extends Sprite2D

signal interact_requested

@export var speed: float = 300.0

func _process(delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")
	position.x += direction * speed * delta

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact_requested.emit()
