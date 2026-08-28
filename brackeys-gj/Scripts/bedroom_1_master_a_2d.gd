extends Area2D

class_name Bedroom1MasterArea

static var mouseEntered : bool
static var arrControls : Array[Control]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bedroom1MasterArea.arrControls.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	print("Mouse entered the bedroom 1 area!")
	mouseEntered = true

func _on_mouse_exited() -> void:
	print("Mouse exited the bedroom 1 area!")
	mouseEntered = false
