extends Button

class_name EvidenceCheck

@export var winScreen : Control
@export var lostScreen : Control

static var enableButton : bool = false
static var startingPos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enableButton = false
	startingPos = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = startingPos

	if enableButton == true:
		disabled = false
	else:
		disabled = true

func _on_pressed() -> void:
	if (EvidenceChecker._checkEvidence(ChainOfEvidence.spawnedEvidencesEntries)) :
		winScreen.visible = true
	else :
		lostScreen.visible = true
