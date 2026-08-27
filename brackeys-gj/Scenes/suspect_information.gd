extends TextEdit

class_name SuspectInfo

static var newText : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = newText

static func _update_text(_textVal : String) -> void:
	newText = _textVal
