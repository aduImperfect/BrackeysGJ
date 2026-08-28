extends Control

class_name HallControl

static var mouseEntered : bool
static var arrControls : Array[Control]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrControls.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	mouseEntered = true

func _on_mouse_exited() -> void:
	mouseEntered = false
