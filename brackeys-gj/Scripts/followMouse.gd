extends Control

class_name FollowMouse

var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position() - drag_offset

# godot callback
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_dragging = true
			drag_offset = get_global_mouse_position() - global_position
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			is_dragging = false
