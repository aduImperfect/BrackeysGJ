extends Node2D

class_name  EvidenceChecker

@export var validEvidencesRes : AllEvidences

static var staticValidEvidences : AllEvidences
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	staticValidEvidences = validEvidencesRes
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

static func _checkEvidence(_playerEvidenceRes : AllEvidences) -> bool:
	var alright : bool = true
	for i in _playerEvidenceRes.entries.size():
		var playerEntry = _playerEvidenceRes.entries[i]
		if(!EvidenceEntry.compareEntries(playerEntry, staticValidEvidences.entries[i])):
			alright = false
			break
	return alright
