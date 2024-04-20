extends Node2D

export var menu_text:String = "" 
onready var label: Label = $Panel/CenterContainer/Label

const SIZE:Vector2 = Vector2(113,40)
const OFFSET:Vector2 = Vector2(56, 20)

func _ready() -> void:
	label.text = menu_text
