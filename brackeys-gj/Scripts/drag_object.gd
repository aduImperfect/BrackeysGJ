extends Control

class_name DragObject

@export var is_dragging: bool = false
@export var drag_offset: Vector2 = Vector2.ZERO
@export var startPos: Vector2 = Vector2.ZERO
@export var draggingImg : Sprite2D
@export var dragComplete : bool = false

func _process(_delta: float) -> void:
	if is_dragging:
		if draggingImg != null:
			draggingImg.visible = true
			draggingImg.global_position = get_global_mouse_position()

	if is_dragging == false && dragComplete == false:
		if Bedroom1MasterControl.mouseEntered == true:
			Bedroom1MasterControl.arrControls.append(self)
			dragComplete = true
			if draggingImg != null:
				global_position = get_global_mouse_position()
				draggingImg.position = Vector2.ZERO
		elif BathControl.mouseEntered == true:
			BathControl.arrControls.append(self)
			dragComplete = true
			if draggingImg != null:
				global_position = get_global_mouse_position()
				draggingImg.position = Vector2.ZERO
		elif Bedroom2Control.mouseEntered == true:
			Bedroom2Control.arrControls.append(self)
			dragComplete = true
			if draggingImg != null:
				global_position = get_global_mouse_position()
				draggingImg.position = Vector2.ZERO
		elif HallControl.mouseEntered == true:
			HallControl.arrControls.append(self)
			dragComplete = true
			if draggingImg != null:
				global_position = get_global_mouse_position()
				draggingImg.position = Vector2.ZERO
		elif LivingRoomControl.mouseEntered == true:
			LivingRoomControl.arrControls.append(self)
			dragComplete = true
			if draggingImg != null:
				global_position = get_global_mouse_position()
				draggingImg.position = Vector2.ZERO
		elif Bedroom3Control.mouseEntered == true:
			Bedroom3Control.arrControls.append(self)
			dragComplete = true
			if draggingImg != null:
				global_position = get_global_mouse_position()
				draggingImg.position = Vector2.ZERO
		else:
			if draggingImg != null:
				draggingImg.visible = false
				draggingImg.global_position = startPos

# godot callback
func _gui_input(_event: InputEvent) -> void:
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			is_dragging = true
			startPos = global_position
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
