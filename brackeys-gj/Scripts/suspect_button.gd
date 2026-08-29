extends TextureButton

var suspectData : ValidSuspects = preload("res://Resources/suspectsRes.tres")

static var suspectCounter : int
var myIndex

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	myIndex =  suspectCounter
	suspectCounter += 1
	if name == "SuspectButton_1":
		_updateInfo(myIndex)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_gui_input(_event: InputEvent) -> void:
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			_updateInfo(myIndex)


func _updateInfo(suspectDataIndex : int) -> void:
	SuspectTitle._update_text(suspectData.entries[suspectDataIndex].suspect_title)
	SuspectName._update_text(suspectData.entries[suspectDataIndex].suspect_name)
	SuspectShortDesc._update_text(suspectData.entries[suspectDataIndex].suspect_shortdesc)
	SuspectDesc._update_text(suspectData.entries[suspectDataIndex].suspect_desc)
	SuspicionSliderVal._update_value(suspectData.entries[suspectDataIndex].suspect_basesuspicionlevel)

func _input(event: InputEvent):
	# Check if a mouse button is clicked while the node has focus
	if has_focus() and event is InputEventMouseButton and event.pressed:
		# If the click position is outside the node's rectangle
		if not get_global_rect().has_point(event.position):
			release_focus()
