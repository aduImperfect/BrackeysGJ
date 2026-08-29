extends Control

class_name EvidenceData

var evidenceData : ValidEvidences = preload("res://Resources/evidencesRes.tres")
static var evidenceCounter : int = 0
var myIndex

static var indexesConsumed : Array[bool] = []

func _ready() -> void:
	if evidenceCounter == 0:
		indexesConsumed.clear()
		for k in evidenceData.entries.size():
			indexesConsumed.append(false)

	myIndex = randi_range(0, evidenceData.entries.size() - 1)

	#var checkCounter : int = 0
	while (indexesConsumed[myIndex] == true): 
		#&& (checkCounter != evidenceData.entries.size()):
		#checkCounter += 1
		myIndex = randi_range(0, evidenceData.entries.size() - 1)

	indexesConsumed[myIndex] = true

	if (evidenceCounter + 1) < evidenceData.entries.size():
		evidenceCounter += 1
	_updateInfo(myIndex)

func _updateInfo(index : int) -> void:
	var entry = evidenceData.entries[index]
	get_child(1)._update_texture(entry.evidence_tex)
	get_child(2)._update_text(entry.evidence_name)
	get_child(3)._update_text(entry.desc)
	get_child(4).evidenceChars = entry.characters
	get_child(4).get_child(0)._update_texture(entry.evidence_tex)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
