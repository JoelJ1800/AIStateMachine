extends State

var home_position: Vector3
@export var max_wander_range:float = 6
@export var min_wait_time: float = 0.2
@export var max_wait_time: float = 2.0

func enter():
	super.enter()
	home_position = controller.position
	new_wander_poosition()

func new_wander_poosition():
	var pos = home_position + random_offset() * randf_range(0, max_wander_range)
	controller.move_to_position(pos)

func navigation_complete():
	var wait_time = randf_range(min_wait_time, max_wait_time)
	await get_tree().create_timer(wait_time).timeout
