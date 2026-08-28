extends Node

@export var itemsHolder : Control
@export var itemInfo : PackedScene

static var spawnedEvidences : Array[Node]
var offset : float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_up")):
		_clearEvidences()
	if(Input.is_action_just_pressed("ui_accept")):
		var entry = EvidenceEntry.makeEntry("teest",["tesssttttt"], "in ur ass", "67")
		_spawnEvidence(entry)
	pass

func _spawnEvidence(entry: EvidenceEntry) -> void:
	var newEvidence := itemInfo.instantiate() as Node2D

	var spawnPos := itemsHolder.global_position
	spawnPos.x += spawnedEvidences.size() * offset

	itemsHolder.add_child(newEvidence)
	newEvidence.global_position = spawnPos

	var nameLab := newEvidence.find_child("EvidenceName") as Label
	nameLab.text = entry.evidence_name

	var orderLab := newEvidence.find_child("EvidenceOrder") as Label
	orderLab.text = str(spawnedEvidences.size() + 1)

	spawnedEvidences.append(newEvidence)

func _checkAndPopulateEvidences(_playerEvidences : AllEvidences) -> void:
	_clearEvidences()
	for evidence in _playerEvidences.entries:
		_spawnEvidence(evidence)
	pass
	
func _clearEvidences() -> void:
	for evidence in spawnedEvidences:
		evidence.queue_free()
	spawnedEvidences.clear()
