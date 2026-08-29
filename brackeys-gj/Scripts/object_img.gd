extends Sprite2D

class_name ObjectTex

var newTex : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _update_texture(_texVal : Texture2D) -> void:
	newTex = _texVal
	texture = newTex
