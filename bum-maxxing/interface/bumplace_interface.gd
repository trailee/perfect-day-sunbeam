extends Node2D
@onready var activities: Control = $"activities UI"
@onready var bumplace: Control = $"bumplace UI"
@onready var tv_buy: Control = $"tv buy UI"
@onready var drinking_buy: Control = $"drinking buy UI"
@onready var eating_buy: Control = $"eating buy UI"
@onready var nap_buy: Control = $"nap buy UI"
@onready var scroll_buy: Control = $"scroll buy UI"
@onready var accessories: Control = $"accessories UI"

signal exit_pressed

func _ready():
	show()
	bumplace.show()
	activities.hide()
	accessories.hide()
	tv_buy.hide()
	drinking_buy.hide()
	eating_buy.hide()
	nap_buy.hide()
	scroll_buy.hide()
	
func _on_activ_pressed() -> void:
	bumplace.hide()
	activities.show()

func _on_access_pressed() -> void:
	bumplace.hide()
	accessories.show()

func _on_button_pressed() -> void:
	exit_pressed.emit()
	if bumplace.visible:
		hide()
	elif activities.visible or accessories.visible:
		activities.hide()
		accessories.hide()
		bumplace.show()
	else:
		tv_buy.hide()
		drinking_buy.hide()
		eating_buy.hide()
		nap_buy.hide()
		scroll_buy.hide()
		activities.show()


# BUTTONS
func _on_tv_pressed() -> void:
	activities.hide()
	tv_buy.show()


func _on_bev_pressed() -> void:
	activities.hide()
	drinking_buy.show()


func _on_muk_pressed() -> void:
	activities.hide()
	eating_buy.show()


func _on_sleep_pressed() -> void:
	activities.hide()
	nap_buy.show()


func _on_scroll_pressed() -> void:
	activities.hide()
	scroll_buy.show()
