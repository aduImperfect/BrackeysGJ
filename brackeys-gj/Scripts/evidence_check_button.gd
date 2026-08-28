extends Button

class_name EvidenceCheck

static var enableButton : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enableButton = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if enableButton == true:
		disabled = false
	else:
		disabled = true

func _on_pressed() -> void:
	#EvidenceChecker._checkEvidence(ChainOfEvidence.spawnedEvidences)
	pass
