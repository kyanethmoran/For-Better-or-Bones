extends CanvasLayer

@onready var bone_counter_label: Label = $BoneCounterLabel

func update_bone_count(amount: int ) -> void:
	bone_counter_label.text = "Bones: " + str(amount)
