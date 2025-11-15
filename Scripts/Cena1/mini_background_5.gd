extends Node2D

# Palavra-passe: sequência de cores (0 = blue, 1 = red)
var password: Array = [1, 1, 1, 1]  # Exemplo: red, blue, red, red, blue, red

# Estado atual dos cubos
var cube_states: Array = [0, 0, 0, 0]

func _ready():
	# Começar todos em blue (estado 0)
	if $"../MiniBackground5".visible == true:
		_update_all_cubes()
	else:
		pass
 

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_check_cube_click(event.position)

func _check_cube_click(mouse_pos: Vector2):
	for i in range(4):
		var sprite_name = "BlueSprite" if i == 0 else "BlueSprite" + str(i + 1)
		var sprite = get_node(sprite_name) as Sprite2D
		var sprite_rect = Rect2(sprite.global_position - sprite.texture.get_size() / 2, sprite.texture.get_size())
		
		if sprite_rect.has_point(mouse_pos):
			# Alternar apenas o cubo clicado
			cube_states[i] = 1 if cube_states[i] == 0 else 0
			_update_cube(i)
			_check_win()
			break

func _update_cube(index: int):
	var blue_name = "BlueSprite" if index == 0 else "BlueSprite" + str(index + 1)
	var red_name = "RedSprite" if index == 0 else "RedSprite" + str(index + 1)
	var blue = get_node(blue_name)
	var red = get_node(red_name)
	
	if cube_states[index] == 0:
		blue.visible = true
		red.visible = false
	else:
		blue.visible = false
		red.visible = true

func _update_all_cubes():
	for i in range(4):
		_update_cube(i)

func _check_win():
	# Verificar se o estado atual corresponde à palavra-passe
	for i in range(4):
		if cube_states[i] != password[i]:
			return
	
	# Acertou a palavra-passe!
	print("PALAVRA-PASSE CORRETA!")
	get_tree().change_scene_to_file("res://Scripts/Cena1/credits.tscn")

func reset_cubes():
	# Resetar todos os cubos para blue (0)
	for i in range(4):
		cube_states[i] = 0
	_update_all_cubes()
