extends Control
class_name ChainOfEvidence

@export var itemsHolder : Control
@export var itemInfo : PackedScene
@export var lineColor : Color = Color.WHITE
@export var lineWidth : float = 2.0
@export var startOffset : Vector2 = Vector2.ZERO
@export var endOffset : Vector2 = Vector2.ZERO
@export var lineZIndex : int = -1250

static var offset : float = 200
var validEvidences : ValidEvidences = preload("res://Resources/evidencesRes.tres")
static var itemsHolderInternal : Control
static var itemInfoInternal : PackedScene
static var spawnedEvidences : Array[Node]
static var spawnedEvidencesEntries : Array[EvidenceEntry]
static var selfInternal : ChainOfEvidence

func _ready() -> void:
	itemsHolderInternal = itemsHolder
	itemInfoInternal = itemInfo
	selfInternal = self
	z_index = lineZIndex
	queue_redraw()

func _process(_delta: float) -> void:
	if spawnedEvidences.size() == validEvidences.entries.size():
		EvidenceCheck.enableButton = true
	else:
		EvidenceCheck.enableButton = false
	if TimelineReset.resetTimeline:
		_clearEvidences()
		TimelineReset.resetTimeline = false

func _draw() -> void:
	var xform := get_global_transform().affine_inverse()
	#for i in range(spawnedEvidences.size() - 1):
		#var la := spawnedEvidences[i] as Node2D
		#var lb := spawnedEvidences[i + 1] as Node2D
		#if not is_instance_valid(la) or not is_instance_valid(lb):
			#continue
		#var from := xform * la.global_position + startOffset
		#var to := xform * lb.global_position + endOffset
		#draw_line(from, to, lineColor, lineWidth)
	var from := xform * itemsHolderInternal.global_position + startOffset
	var to := xform * itemsHolderInternal.global_position + endOffset
	draw_line(from, to, lineColor, lineWidth)

static func _spawnEvidence(entry: EvidenceEntry) -> void:
	var newEvidence := itemInfoInternal.instantiate() as Node2D
	var spawnPos := itemsHolderInternal.global_position
	spawnPos.x += spawnedEvidences.size() * offset
	itemsHolderInternal.add_child(newEvidence)
	newEvidence.global_position = spawnPos
	var nameLab := newEvidence.find_child("EvidenceName") as Label
	nameLab.text = entry.evidence_name

	var evidenceTex := newEvidence.find_child("EvidenceTex") as TextureRect
	evidenceTex.texture = entry.evidence_tex
	spawnedEvidencesEntries.append(entry)
	spawnedEvidences.append(newEvidence)

	#if selfInternal:
		#selfInternal.queue_redraw()

func _checkAndPopulateEvidences(_playerEvidences : AllEvidences) -> void:
	_clearEvidences()
	for evidence in _playerEvidences.entries:
		_spawnEvidence(evidence)

func _clearEvidences() -> void:
	for evidence in spawnedEvidences:
		evidence.queue_free()
	spawnedEvidences.clear()
	spawnedEvidencesEntries.clear()
