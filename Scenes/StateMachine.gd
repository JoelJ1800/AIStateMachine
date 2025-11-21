class_name StateMachine
extends Node

@export var default_state:State
var current_state:State
var states:Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.initialize()
