extends ScrollContainer

var evidenceData = preload("res://Resources/evidencesRes.tres")
var evidenceScene : PackedScene = preload("res://Scenes/evidence_template.tscn")
@export var holder : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawnEvidences() -> void:
	for evidenceIndex in  evidenceData.entries.size():
		var entry = evidenceData.entries[evidenceIndex]
		entry
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
