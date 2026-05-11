extends CanvasLayer

@onready var bone_counter_label: Label = $BoneCounterLabel
@onready var objective_label: Label = $"ObjectiveLabel"

func update_bone_count(amount: int ) -> void:
	bone_counter_label.text = "Bones: " + str(amount)

func show_level_complete() -> void:
	objective_label.text = "All bones collected!"
