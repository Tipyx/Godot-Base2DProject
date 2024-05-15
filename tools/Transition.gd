class_name Transition extends Node2D

signal next_scene_can_be_loaded

@onready var animation_player := $AnimationPlayer

var callable : Callable

func init(total_duration:float, c:Callable) -> void:
	callable = c
	animation_player.speed_scale = 0.5 / (total_duration / 2.)
	
func _ready() -> void:
	get_parent().move_child(self, -1)

func load_next_scene() -> void:
	next_scene_can_be_loaded.emit()
	animation_player.play("FadeOut")
	callable.call()
