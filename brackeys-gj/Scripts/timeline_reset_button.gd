extends Button

class_name TimelineReset

static var resetTimeline : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resetTimeline = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	Bedroom1MasterControl.arrControls.clear()
	BathControl.arrControls.clear()
	Bedroom2Control.arrControls.clear()
	HallControl.arrControls.clear()
	LivingRoomControl.arrControls.clear()
	Bedroom3Control.arrControls.clear()
	
	DraggableObject.forcedUpdateStatic = true
	resetTimeline = true
