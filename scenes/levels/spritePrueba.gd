extends Sprite2D

var speed = 4
var angular_speed = PI


func _process(delta):
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta


func _on_button_pressed() -> void:
	pass # Replace with function body.
