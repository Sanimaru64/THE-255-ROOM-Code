extends Node2D

var hand_cursor = preload("res://Assets/Idk/Sprite-003301.png") #cool ass image
var detail_selected = false
var Score = 0

func _ready():
	
	$MiniBackground3/AudioStreamPlayer2D.stop()
	pass # Replace with function body.
#(  imagem cursor
func change_cursor_hand():
	if !detail_selected:
		Input.set_custom_mouse_cursor(hand_cursor) # (With nodes) if cursor is on area it changes the image of cursor

func change_cursor_back():
	if !detail_selected:
		Input.set_custom_mouse_cursor(null)  # if the cursor isnt in any area then it changes back to the original

func change_cursor_hand_detail():
	Input.set_custom_mouse_cursor(hand_cursor)
	
func change_cursor_back_detail():
	Input.set_custom_mouse_cursor(null)
	
#)

#(  quadro 
func _on_gaveta_area_input_event(viewport, event: InputEvent, shape_idx):
		if event is InputEventMouseButton and event.pressed:
			$gaveta1.visible = false
			$Interactable1s1.visible = true  #Opens the door (down)
			$Event2_1.visible = true #Activates hitbox of event 21
func _on_interactable_1s_1_area_input_event(viewport, event: InputEvent, shape_idx): #
		if event is InputEventMouseButton and event.pressed:
			$gaveta1.visible = true
			$Interactable1s1.visible = false  #Opens the door (down)
#)

#( Events
func _on_event_1_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground1.visible = true
		$gaveta1.visible = false
		$lixo/lixorea.visible = false
		$Event1.visible = false
		$Event2.visible = false
		$Event3.visible = false
		$Event4.visible = false
		$Event5.visible = false
		detail_selected = false

func _on_event_2_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground2.visible = true
		$gaveta1.visible = false
		$lixo/lixorea.visible = false
		$Event1.visible = false
		$Event2.visible = false
		$Event3.visible = false
		$Event4.visible = false
		$Event5.visible = false
		detail_selected = false

func _on_event_3_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground3/AudioStreamPlayer2D.play()
		$MiniBackground3.visible = true
		$gaveta1.visible = false
		$lixo/lixorea.visible = false
		$Event1.visible = false
		$Event2.visible = false
		$Event3.visible = false
		$Event4.visible = false
		$Event5.visible = false
		detail_selected = false

func _on_event_4_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground4.visible = true
		$gaveta1.visible = false
		$lixo/lixorea.visible = false
		$Event1.visible = false
		$Event2.visible = false
		$Event3.visible = false
		$Event4.visible = false
		$Event5.visible = false
		detail_selected = false

func _on_event_5_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		
		$MiniBackground5.visible = true
		var mini_bg5 = get_node("MiniBackground5")
		mini_bg5.reset_cubes()
		$gaveta1.visible = false
		$lixo/lixorea.visible = false
		$MiniBackground5/BlueSprite.position = Vector2(365.685,-300.63)
		$MiniBackground5/BlueSprite2.position = Vector2(495.886,277.351)
		$MiniBackground5/BlueSprite3.position = Vector2(613.628,-301.295)
		$MiniBackground5/BlueSprite4.position = Vector2(611.136,-13.967)
		$Event5.visible = false
		detail_selected = false

func _on_event_2_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground2_1.visible = true
		$gaveta1.visible = false
		$lixo/lixorea.visible = false
		$Event1.visible = false
		$Event2.visible = false
		$Event3.visible = false
		$Event4.visible = false
		$Event5.visible = false
		detail_selected = false
#)


func _on_lixorea_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$Kitem2.visible = true
		$lixo/lixorea.visible = false


#(  Buttao Exit
func _on_area_exit_1_input_event(viewpor, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground1.visible = false
		$Interactable1s1.visible = true
		$lixo/lixorea.visible = true
		$Event1.visible = false
		$ClearEvent1.visible = true
		detail_selected = true

func _on_area_exit_2_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground2.visible = false
		$gaveta1/gavetaArea.visible = false
		$Event2.visible = true
		$Event3.visible = true
		$ClearEvent2.visible = true
		detail_selected = true

func _on_area_exit_2_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		$Event1.visible = true
		$MiniBackground2_1.visible = false
		detail_selected = true

func _on_area_exit_3b_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground3/AudioStreamPlayer2D.stop()
		$MiniBackground3.visible = false
		$Event2.visible = true
		detail_selected = true

func _on_area_exit_3_input_event(viewport, event: InputEvent, shape_idx: ):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground3/AudioStreamPlayer2D.stop()
		$MiniBackground3.visible = false
		$Event3.visible = false
		$ClearEvent3.visible = true
		detail_selected = true

func _on_area_exit_4_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$MiniBackground4.visible = false
		$Event4.visible = false
		$Event5.visible = true
		$ClearEvent4.visible = true
		detail_selected = true

#)
