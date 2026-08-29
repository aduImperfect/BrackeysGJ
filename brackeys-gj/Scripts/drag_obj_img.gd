extends Sprite2D

class_name DragObjImage

var newTex : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	texture = newTex

func _update_texture(_texVal : Texture2D) -> void:
	newTex = _texVal
