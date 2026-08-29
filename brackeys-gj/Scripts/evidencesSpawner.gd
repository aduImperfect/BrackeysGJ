extends ScrollContainer

var evidenceData = preload("res://Resources/evidencesRes.tres")
var evidenceScene : PackedScene = preload("res://Scenes/evidence_template.tscn")
@export var holder : Control
@export var hOffset : float = 150
@export var vOffset : float = 100
var spawnedEvidences : Array[Control]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnEvidences()

func spawnEvidences() -> void:
	for evidenceIndex in  evidenceData.entries.size():
		var spawnedEvidence = evidenceScene.instantiate() as EvidenceData
		var column = evidenceIndex % 2
		var row = evidenceIndex / 2
		var spawnPos = global_position + Vector2(
			column * hOffset,
			row * vOffset
		)
		holder.add_child(spawnedEvidence)
		spawnedEvidence.name = "Evidence" +  str(spawnedEvidences.size() + 1)
		spawnedEvidence.global_position = spawnPos
		spawnedEvidences.append(spawnedEvidence)
		print(str(evidenceIndex))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
