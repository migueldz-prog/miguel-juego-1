extends Node

@export var mob_scene: PackedScene
var score


func _ready():
	new_game()


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_score_timer_timeout():
	score += 1


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_mob_timer_timeout():
	#nueva instancia de la escena Mob
	var mob = mob_scene.instantiate()

	#osición aleatoria en el Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	#sireccion perpendicular al camino
	var direction = mob_spawn_location.rotation + PI / 2

	#posi de enemigo en la ubicación aleatoria.
	mob.position = mob_spawn_location.position

	#aleatoriedad a la dirección.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	#v aleatoria
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	#enemigo a la escena principal
	add_child(mob)
