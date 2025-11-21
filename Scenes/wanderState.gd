extends State

var home_position: Vector3
@export var max_wander_range: float = 6
@export var min_wait_time: float = 0.2
@export var max_wait_time: float = 2.0
@export var chase_range:float = 4.0


func enter():
	super.enter()
	home_position = controller.position
	controller.look_at_player = false
	await get_tree().process_frame 
	new_wander_poosition()


func new_wander_poosition():
	var pos = home_position + random_offset() * randf_range(0, max_wander_range)
	controller.move_to_position(pos)


func navigation_complete():
	var wait_time = randf_range(min_wait_time, max_wait_time)
	await get_tree().create_timer(wait_time).timeout
	if not active:
		return
	new_wander_poosition()

func update(delta):
	if controller.player_distance < chase_range:
		state_machine.change_state("Chase")
