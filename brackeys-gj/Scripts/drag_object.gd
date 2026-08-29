extends Control

class_name DraggableObject

@export var is_dragging: bool = false
@export var drag_offset: Vector2 = Vector2.ZERO
@export var startPos: Vector2 = Vector2.ZERO
@export var draggingImg : Sprite2D
@export var dragComplete : bool = false
@export var evidenceBGImage : Sprite2D
@export var evidenceName : TextEdit
@export var evidenceDesc : TextEdit
@export var evidenceModVal : Color
@export var newEvidenceModVal : Color

@export var followEvidenceControl : Control

static var forcedUpdateStatic : bool = false
static var waitCount : int = 0
static var waitCounter : int = 0

func _ready() -> void:
	evidenceModVal = evidenceBGImage.modulate
	dragComplete = false
	waitCount = 0
	waitCounter = EvidenceData.evidenceCounter

func _process(_delta: float) -> void:
	startPos = followEvidenceControl.global_position

	if DraggableObject.forcedUpdateStatic == true:
		dragComplete = false
		drag_offset = Vector2.ZERO
		global_position = startPos
		is_dragging = false
		if draggingImg != null:
			draggingImg.visible = false
			draggingImg.z_index = -200
		evidenceBGImage.modulate = evidenceModVal
		if waitCount < waitCounter:
			waitCount += 1
		else:
			DraggableObject.forcedUpdateStatic = false
			waitCount = 0

	if is_dragging:
		if draggingImg != null:
			draggingImg.visible = true
			draggingImg.z_index = 1000
			draggingImg.global_position = get_global_mouse_position()

	if is_dragging == false && dragComplete == false:
		if Bedroom1MasterControl.mouseEntered == true:
			Bedroom1MasterControl.arrControls.append(self)
			_set_values("Bedroom1MasterControl")
		elif BathControl.mouseEntered == true:
			BathControl.arrControls.append(self)
			_set_values("BathControl")
		elif Bedroom2Control.mouseEntered == true:
			Bedroom2Control.arrControls.append(self)
			_set_values("Bedroom2Control")
		elif HallControl.mouseEntered == true:
			HallControl.arrControls.append(self)
			_set_values("HallControl")
		elif LivingRoomControl.mouseEntered == true:
			LivingRoomControl.arrControls.append(self)
			_set_values("LivingRoomControl")
		elif Bedroom3Control.mouseEntered == true:
			Bedroom3Control.arrControls.append(self)
			_set_values("Bedroom3Control")
		else:
			if draggingImg != null:
				draggingImg.visible = false
				draggingImg.global_position = startPos

func _set_values(_locationName : String) -> void:
	if draggingImg != null && draggingImg.visible == true:
		dragComplete = true
		global_position = get_global_mouse_position()
		draggingImg.position = Vector2.ZERO
		var entry = EvidenceEntry.makeEntry(evidenceName.text,["tesssttttt"], _locationName, evidenceDesc.text)
		ChainOfEvidence._spawnEvidence(entry)
		evidenceBGImage.modulate = newEvidenceModVal

# godot callback
func _gui_input(_event: InputEvent) -> void:
	if dragComplete == true:
		return

	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			is_dragging = true
			#startPos = global_position
			draggingImg = get_child(0) as Sprite2D
			drag_offset = get_global_mouse_position() - global_position
		elif _event.button_index == MOUSE_BUTTON_LEFT and not _event.pressed:
			is_dragging = false

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
