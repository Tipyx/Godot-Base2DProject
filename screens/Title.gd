class_name Title extends Node2D

@export_category("Nodes")
@export var new_game_btn : Button
@export var quit_btn : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game_btn.pressed.connect(_on_pressed_new_game_btn)
	quit_btn.pressed.connect(_on_pressed_quit_btn)
	
func _on_pressed_new_game_btn() -> void:
	Global.main.new_game()
	
func _on_pressed_quit_btn() -> void:
	get_tree().quit()
