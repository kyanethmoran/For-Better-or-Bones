extends CharacterBody3D

@export var move_speed: float = 5.0
@export var jump_velocity: float = 4.5
@export var gravity: float = 9.8

@onready var anim_player: AnimationPlayer = $AnimatedSkeletonVisual/AnimationPlayer
@onready var game_ui = get_tree().current_scene.get_node("GameUI")

var bones_collected: int = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity*delta
		
	var input_dir := Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_back"
	)
	
	var direction := Vector3(input_dir.x, 0, input_dir.y).normalized()
	
	if direction.length()>0:
		$AnimatedSkeletonVisual.look_at(global_position - direction, Vector3.UP)
	
	if direction:
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		velocity.z = move_toward(velocity.z,0, move_speed)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
	if not is_on_floor():
		play_animation("Jump_Idle")
	elif direction.length() > 0:
		play_animation("Walking_A")
	else:
		play_animation("T-Pose")
	
	move_and_slide()
	
func play_animation(anim_name: String) -> void:
	if anim_player.current_animation != anim_name:
		anim_player.play(anim_name)
		
func collect_bone() -> void:
	bones_collected += 1
	print("Bones collected: ", bones_collected)
	game_ui.update_bone_count(bones_collected)
	
