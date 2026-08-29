extends Sprite2D

class_name DragObjImage

var newTex : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _update_texture(_texVal : Texture2D) -> void:
	newTex = _texVal
	texture = newTex

func _input(_event : InputEvent) -> void:
	#if _event is InputEventMouseButton:
		#if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			#DraggableObject._ind_reset_ext()
	pass
