extends Node2D

class_name  EvidenceChecker

static  var validEvidencesRes : ValidEvidences  = preload("res://Resources/evidencesRes.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

static func _checkEvidence(_playerEvidenceRes : Variant) -> bool:
	var alright : bool = true
	var evidences
	if _playerEvidenceRes is AllEvidences:
		evidences = _playerEvidenceRes.entries
	else :
		evidences = _playerEvidenceRes
	
	for i in evidences.size():
		var playerEntry = evidences[i]
		if(!EvidenceEntry.compareEntries(playerEntry, validEvidencesRes.entries[i])):
			alright = false
			break
	return alright
