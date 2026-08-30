extends Control

class_name DraggableObject

@export var is_dragging: bool = false
@export var drag_offset: Vector2 = Vector2.ZERO
@export var startPos: Vector2 = Vector2.ZERO
@export var draggingImg : TextureRect
@export var dragComplete : bool = false
@export var evidenceBGImage : Sprite2D
@export var evidenceName : Label
@export var evidenceChars : Array[String]
@export var evidenceDesc : TextEdit
@export var evidenceModVal : Color
@export var newEvidenceModVal : Color

@export var setPos : Vector2 = Vector2.ZERO

@export var followEvidenceControl : Control

static var currentControl : Control

static var forcedUpdateStatic : bool = false
static var waitCount : int = 0
static var waitCounter : int = 0
var draggingParent : Control
var anotherStartPos : Vector2
var presssCount : int

func _ready() -> void:
	evidenceModVal = evidenceBGImage.modulate
	dragComplete = false
	waitCount = 0
	waitCounter = EvidenceData.evidenceCounter
	draggingParent = draggingImg.get_parent() as Control
	presssCount = 0

func _process(_delta: float) -> void:
	startPos = followEvidenceControl.global_position
	#if name.contains("140"):
		#print(name + " "  + str(startPos) + " " + str(anotherStartPos) + " " + str(global_position))

	if DraggableObject.forcedUpdateStatic == true:
		HouseManager.dragList.clear()
		HouseManager.forceDrawCall = true
		setPos = Vector2.ZERO
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

	#if(draggingImg.get_parent() != draggingParent):
		#draggingImg.reparent(draggingParent)
	#if is_dragging == false && abs(startPos - global_position) != Vector2.ZERO:
		#var scene_root = get_tree().current_scene
		#if(draggingImg.get_parent() != scene_root):
			#draggingParent.reparent(scene_root)
	if(presssCount == 1) :
		print(name)
		var scene_root = get_tree().current_scene
		if(draggingImg.get_parent() != scene_root):
			draggingParent.reparent(scene_root)

	presssCount = 0
	if is_dragging == false && dragComplete == false:
		if Bedroom1MasterControl.mouseEntered == true:
			Bedroom1MasterControl.arrControls.append(self)
			_set_values("Bedroom1Master")
		elif BathControl.mouseEntered == true:
			BathControl.arrControls.append(self)
			_set_values("Bath")
		elif Bedroom2Control.mouseEntered == true:
			Bedroom2Control.arrControls.append(self)
			_set_values("Bedroom2")
		elif HallControl.mouseEntered == true:
			HallControl.arrControls.append(self)
			_set_values("Hall")
		elif LivingRoomControl.mouseEntered == true:
			LivingRoomControl.arrControls.append(self)
			_set_values("LivingRoom")
		elif Bedroom3Control.mouseEntered == true:
			Bedroom3Control.arrControls.append(self)
			_set_values("Bedroom3")
		else:
			if draggingImg != null:
				draggingImg.visible = false
				draggingImg.global_position = startPos

	if setPos != Vector2.ZERO:
		global_position = setPos

func _set_values(_locationName : String) -> void:
	if draggingImg != null && draggingImg.visible == true:
		dragComplete = true
		#var scene_root = get_tree().current_scene
		#if(draggingImg.get_parent() != scene_root):
			#draggingParent.reparent(scene_root)
		global_position = get_global_mouse_position()
		setPos = global_position
		draggingImg.position = Vector2.ZERO
		var text = evidenceName.text
		var entry = EvidenceEntry.makeEntry(draggingImg.texture, evidenceName.text, evidenceChars, _locationName, evidenceDesc.text)
		ChainOfEvidence._spawnEvidence(entry)
		evidenceBGImage.modulate = newEvidenceModVal
		HouseManager.dragList.append(self)
		HouseManager.forceDrawCall = true

static func _ind_reset_ext() -> void:
	currentControl._individual_reset()

func _individual_reset() -> void:
	for k in HouseManager.dragList.size():
		if HouseManager.dragList[k] == self:
			HouseManager.dragList.remove_at(k)
			break
	HouseManager.forceDrawCall = true
	setPos = Vector2.ZERO
	dragComplete = false
	drag_offset = Vector2.ZERO
	global_position = startPos
	is_dragging = false
	if draggingImg != null:
		draggingImg.visible = false
		draggingImg.z_index = -200
	evidenceBGImage.modulate = evidenceModVal

# godot callback
func _gui_input(_event: InputEvent) -> void:
	if dragComplete == true:
		return

	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			print("mouse clicked ", name)
			is_dragging = true
			#startPos = global_position
			anotherStartPos = global_position
			draggingImg = get_child(0) as TextureRect
			drag_offset = get_global_mouse_position() - global_position
			presssCount = 1
		elif _event.button_index == MOUSE_BUTTON_LEFT and not _event.pressed:
			is_dragging = false
			presssCount = 0

func _input(_event: InputEvent):
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and not _event.pressed:
			is_dragging = false
			presssCount = 0
