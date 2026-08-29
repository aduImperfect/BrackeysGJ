extends Control

class_name HouseManager

static var dragList : Array[Control]
static var line_color: Color = Color.BLACK
static var line_width: float = 2.0

static var forceDrawCall : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	forceDrawCall = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if forceDrawCall:
		queue_redraw()
		forceDrawCall = false

func _draw() -> void:
	if dragList.size() <= 1:
		
		return
	
	for k in dragList.size() - 1:
		draw_line(dragList[k].get_child(0).global_position, dragList[k + 1].get_child(0).global_position, line_color, line_width)
