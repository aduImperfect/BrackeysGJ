extends TextureButton

@export var suspectText : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_gui_input(_event: InputEvent) -> void:
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			SuspectInfo._update_text(suspectText)
			pass # Replace with function body.

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
