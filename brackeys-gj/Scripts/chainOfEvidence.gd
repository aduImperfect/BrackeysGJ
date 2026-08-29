extends Node

class_name ChainOfEvidence

@export var itemsHolder : Control
@export var itemInfo : PackedScene
static var offset : float = 100

var validEvidences : ValidEvidences = preload("res://Resources/evidencesRes.tres")
static var itemsHolderInternal : Control
static var itemInfoInternal : PackedScene
static var spawnedEvidences : Array[Node]
static var spawnedEvidencesEntries : Array[EvidenceEntry]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemsHolderInternal = itemsHolder
	itemInfoInternal = itemInfo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if spawnedEvidences.size() == 1:
		EvidenceCheck.enableButton = true
	else:
		EvidenceCheck.enableButton = false

	if TimelineReset.resetTimeline:
		_clearEvidences()
		TimelineReset.resetTimeline = false

static func _spawnEvidence(entry: EvidenceEntry) -> void:
	var newEvidence := itemInfoInternal.instantiate() as Node2D

	var spawnPos := itemsHolderInternal.global_position
	spawnPos.x += spawnedEvidences.size() * offset

	itemsHolderInternal.add_child(newEvidence)
	newEvidence.global_position = spawnPos

	var nameLab := newEvidence.find_child("EvidenceName") as Label
	nameLab.text = entry.evidence_name

	var orderLab := newEvidence.find_child("EvidenceOrder") as Label
	orderLab.text = str(spawnedEvidences.size() + 1)

	spawnedEvidencesEntries.append(entry)
	spawnedEvidences.append(newEvidence)

func _checkAndPopulateEvidences(_playerEvidences : AllEvidences) -> void:
	_clearEvidences()
	for evidence in _playerEvidences.entries:
		_spawnEvidence(evidence)

func _clearEvidences() -> void:
	for evidence in spawnedEvidences:
		evidence.queue_free()
	spawnedEvidences.clear()
	spawnedEvidencesEntries.clear()
