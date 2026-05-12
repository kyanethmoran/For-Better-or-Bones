extends Area3D

@onready var game_ui = get_tree().current_scene.get_node("GameUI")

var level_completed: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node3D) -> void:
	if level_completed:
		return
	
	if body.name != "Player":
		return
		
	if body.has_collected_all_bones():
		level_completed = true
		print("Dungeon complete!")
		game_ui.update_objective("Dungeon complete!")
	else: 
		print("Find all the bones first!")
		game_ui.update_objective("Find all the bones first!")
