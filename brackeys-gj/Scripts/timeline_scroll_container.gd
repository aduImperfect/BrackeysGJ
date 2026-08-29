extends ScrollContainer

@export var scrollMultiplier : int = 0

@export var evidenceTimeline : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#Make sure to expand the scroll size depending on the number of evidences in the chain.
	evidenceTimeline.custom_minimum_size.x = scrollMultiplier * ChainOfEvidence.spawnedEvidencesEntries.size()
