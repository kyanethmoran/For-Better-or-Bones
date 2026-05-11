extends Area3D

# When something enters the pickup area,
# check if it is the Player,
# print the message,
# then remove the pickup from the scene.

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		print ("Bone collected!")
		queue_free()
