extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
@export var textures: Array[Texture2D] = []
@onready var sprite: Sprite2D = $Sprite2D

var current_index: int = 0

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("wwy")
		switch_look()

func switch_look() -> void:
	if textures.is_empty():
		return
	
	# Move to the next index, loop back to 0 at the end
	current_index = (current_index + 1) % textures.size()
	
	# Apply the new texture
	sprite.texture = textures[current_index]
