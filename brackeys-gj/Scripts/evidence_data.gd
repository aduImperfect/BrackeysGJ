extends Control

class_name EvidenceData

@export var evidenceTex : Texture2D
@export var evidenceName : String
@export var evidenceDesc : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	ObjectTex._update_texture(evidenceTex)
	ObjectName._update_text(evidenceName)
	ObjectDesc._update_text(evidenceDesc)

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
