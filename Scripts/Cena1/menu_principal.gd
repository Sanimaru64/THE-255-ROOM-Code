extends Control

var hand_cursor = preload("res://Assets/Idk/Sprite-003301.png") #cool ass image

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func change_cursor_hand_detail():
	Input.set_custom_mouse_cursor(hand_cursor)

func change_cursor_back_detail():
	Input.set_custom_mouse_cursor(null)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scripts/Cena1/cutscene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
