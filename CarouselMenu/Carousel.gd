extends Control
signal item_selected

onready var menu_item_1: Node2D = $MenuItem1
onready var menu_item_2: Node2D = $MenuItem2
onready var menu_item_3: Node2D = $MenuItem3
onready var menu_item_4: Node2D = $MenuItem4
onready var menu_item_5: Node2D = $MenuItem5
onready var menu_item_6: Node2D = $MenuItem6

onready var menu_items:Array = [
	menu_item_1, menu_item_2, menu_item_3,
	menu_item_4, menu_item_5, menu_item_6
]
onready var active_item_index:int = 0

onready var tween: Tween = $Tween
var is_tweening:bool = false 

func tween_items_clockwise()->void: 
	for n in range(5, 0, -1): 
		var mA:Node2D = menu_items[n]
		var mB:Node2D = menu_items[n-1]
		tween.interpolate_property(mA, "position", mA.position, mB.position,.5)
		tween.interpolate_property(mA, "scale", mA.scale, mB.scale,.5)
	tween.interpolate_property(menu_items[0], "position", menu_items[0].position, menu_items[5].position,.5)
	tween.interpolate_property(menu_items[0], "scale", menu_items[0].scale, menu_items[5].scale,.5)
	tween.start()

func tween_items_counter_clockwise()->void: 
	for n in range(0, 5): 
		var mA:Node2D = menu_items[n]
		var mB:Node2D = menu_items[n+1]
		tween.interpolate_property(mA, "position", mA.position, mB.position,.5)
		tween.interpolate_property(mA, "scale", mA.scale, mB.scale,.5)
	tween.interpolate_property(menu_items[5], "position", menu_items[5].position, menu_items[0].position,.5)
	tween.interpolate_property(menu_items[5], "scale", menu_items[5].scale, menu_items[0].scale,.5)
	tween.start()

func rotate_clockwise()->void: 
	if is_tweening:return 
	is_tweening = true 
	active_item_index += 1
	if active_item_index > 5: 
		active_item_index = 0
	tween_items_clockwise()

func rotate_counter_clockwise()->void: 
	if is_tweening:return 
	is_tweening = true 
	active_item_index -= 1
	if active_item_index < 0: 
		active_item_index = 5
	tween_items_counter_clockwise()
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey: 
		if !event.pressed: 
			if event.scancode == KEY_LEFT: 
				print("left")
				rotate_clockwise()
			elif event.scancode == KEY_RIGHT: 
				print("right")
				rotate_counter_clockwise()
			elif event.scancode == KEY_KP_ENTER or event.scancode == KEY_ENTER: 
				emit_signal("item_selected", menu_items[active_item_index])
				print(menu_items[active_item_index].name)
				queue_free()



func _on_Tween_tween_all_completed() -> void:
	is_tweening = false 
	pass # Replace with function body.
