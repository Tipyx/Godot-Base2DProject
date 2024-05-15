class_name Main extends Node2D

@export_group("Resources")
@export var transition_ps : PackedScene
@export var title_screen_ps : PackedScene
@export var end_level_ps : PackedScene
@export var level_ps : PackedScene

@export_group("Nodes")
@export var scenes_wrapper : Node2D

var level : Level
var title : Title
var end_level : EndLevel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	Global.main = self
	
	Global.game_data.init()
	
	var user_data : UserData = UserData.new()
	Global.user_data = user_data
	
	#get_viewport().physics_object_picking_sort = true
	
	go_to_title_screen()

func go_to_title_screen() -> void:
	var transition : Transition = transition_ps.instantiate()
	add_child(transition)
	transition.init(1, func() -> void:
		clean()
	
		title = title_screen_ps.instantiate()
		scenes_wrapper.add_child(title)
	)	
	
func new_game() -> void:
	var transition : Transition = transition_ps.instantiate()
	add_child(transition)
	transition.init(1, func() -> void:
		clean()
		
		level = level_ps.instantiate()
		scenes_wrapper.add_child(level)
	)
	
func go_to_next_level() -> void:
	var transition : Transition = transition_ps.instantiate()
	add_child(transition)
	transition.init(1, func() -> void:
		clean()
		
		level = level_ps.instantiate()
		scenes_wrapper.add_child(level)
	)
	
func go_to_end_level() -> void:
	var transition : Transition = transition_ps.instantiate()
	add_child(transition)
	transition.init(1, func() -> void:
		clean()
		
		end_level = end_level_ps.instantiate()
		scenes_wrapper.add_child(end_level)
	)
	
func clean() -> void:
	if end_level:
		end_level.queue_free()
		end_level = null
	if title:
		title.queue_free()
		title = null
	if level:
		level.queue_free()
		level = null

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_back_title"):
		go_to_title_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
