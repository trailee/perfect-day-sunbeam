extends Node2D

@onready var bumplace: Node2D = $ui/HBoxContainer/bumplace_interface
@onready var cans: Sprite2D = $interactable/cans
@onready var tv: Sprite2D = $interactable/tv
@onready var marketplace: Sprite2D = $interactable/marketplace
@onready var chipanimation: Node2D = $interactable/chipanimation

# ANIMATIONS
@onready var mask: Sprite2D = $interactable/mask
@onready var mask_anim: AnimatedSprite2D = $interactable/mask_anim

@export var textures: Array[Texture2D] = []
@onready var sprite: Sprite2D = $Sprite2D

var current_index: int = 0

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		switch_look()

func switch_look() -> void:
	if textures.is_empty():
		return
	
	# Move to the next index, loop back to 0 at the end
	current_index = (current_index + 1) % textures.size()
	
	# Apply the new texture
	sprite.texture = textures[current_index]

func _ready():
	bumplace.hide()
	mask.show()

func _on_static_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		bumplace.show()
		$bumbook.play()


func _on_static_body_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		mask_anim.play('default')
		if mask_anim.visible: await mask_anim.animation_finished
