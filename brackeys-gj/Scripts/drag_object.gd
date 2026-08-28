extends Control

class_name DragObject

var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO
var startPos: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position() - drag_offset

# godot callback
func _gui_input(_event: InputEvent) -> void:
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			is_dragging = true
			startPos = global_position
			drag_offset = get_global_mouse_position() - global_position
		elif _event.button_index == MOUSE_BUTTON_LEFT and not _event.pressed:
			is_dragging = false

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
