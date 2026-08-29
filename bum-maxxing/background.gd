extends Node2D
@onready var activities: Node2D = $ui/HBoxContainer/activities_interface
@onready var bumplace: Node2D = $ui/HBoxContainer/bumplace_interface

@export var textures: Array[Texture2D] = []
@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	activities.hide()
	bumplace.hide()

func _on_static_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		bumplace.show()
