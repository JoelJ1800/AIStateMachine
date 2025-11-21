class_name AIController
extends CharacterBody3D

@export var walk_speed: float = 1.0
@export var run_speed: float = 2.5

var is_running: bool = false
var is_stopped: bool = false
var look_at_playert: bool = false
var move_direction: Vector3
var target_y_rot: float
var player_distance: float

@onready var agent: NavigationAgent3D = get_node("NavigationAgent3D")
@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var player = get_tree().get_nodes_in_group("Player")[0]


func _process(delta: float) -> void:
	if player != null:
		player_distance = position.distance_to(player.position)


func _physics_process(delta: float) -> void:
	pass


func move_to_position(to_position: Vector3, adjust_pos: bool = true):
	pass
