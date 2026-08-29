extends ScrollContainer

var evidenceData = preload("res://Resources/evidencesRes.tres")
var evidenceScene : PackedScene = preload("res://Scenes/evidence_template.tscn")
@export var holder : Control
@export var hOffset : float = 150
@export var vOffset : float = 100
@export var minxOffset : float = 0
@export var minyOffset : float = 0
@export var scrollMultiplier : int = 0

@export var evidenceLocker : Control

var spawnedEvidences : Array[Control]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnEvidences()

func spawnEvidences() -> void:
	#Make sure to expand the scroll size depending on the number of evidences spawned in.
	evidenceLocker.custom_minimum_size.y = scrollMultiplier * (evidenceData.entries.size()/2)

	for evidenceIndex in  evidenceData.entries.size():
		var spawnedEvidence = evidenceScene.instantiate() as EvidenceData
		var column = evidenceIndex % 2
		var row = evidenceIndex / 2
		var spawnPos = global_position + Vector2(
			minxOffset + column * hOffset,
			minyOffset + row * vOffset
		)
		holder.add_child(spawnedEvidence)
		spawnedEvidence.name = "Evidence" +  str(spawnedEvidences.size() + 1)
		spawnedEvidence.global_position = spawnPos
		spawnedEvidences.append(spawnedEvidence)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
