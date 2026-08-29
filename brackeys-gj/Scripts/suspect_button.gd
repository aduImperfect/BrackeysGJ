extends TextureButton

@export var suspectTitle : String
@export var suspectName : String
@export_multiline var suspectShortDesc : String
@export_multiline var suspectInfo : String
@export var suspectVal : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == "SuspectButton_1":
		SuspectTitle._update_text(suspectTitle)
		SuspectName._update_text(suspectName)
		SuspectShortDesc._update_text(suspectShortDesc)
		SuspectInfo._update_text(suspectInfo)
		SuspicionSliderVal._update_value(suspectVal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_gui_input(_event: InputEvent) -> void:
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			SuspectTitle._update_text(suspectTitle)
			SuspectName._update_text(suspectName)
			SuspectShortDesc._update_text(suspectShortDesc)
			SuspectInfo._update_text(suspectInfo)
			SuspicionSliderVal._update_value(suspectVal)

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
