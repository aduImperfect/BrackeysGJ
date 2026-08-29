extends Button

class_name EvidenceCheck

@export var winScreen : Control
@export var lostScreen : Control

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
	if (EvidenceChecker._checkEvidence(ChainOfEvidence.spawnedEvidencesEntries)) :
		winScreen.visible = true
	else :
		lostScreen.visible = true
