extends Node2D

# Estado dos cubos: 0 = blue, 1 = red
var cube_states: Array = [0, 0, 0, 0, 0, 0]

func _ready():
	# Configurar estado inicial - aleatório
	randomize()
	for i in range(6):
		# Aleatório: 0 ou 1
		cube_states[i] = randi() % 2
		
		var blue_name = "BlueSprite" if i == 0 else "BlueSprite" + str(i + 1)
		var red_name = "RedSprite" if i == 0 else "RedSprite" + str(i + 1)
		var blue = get_node(blue_name)
		var red = get_node(red_name)
		
		# Se 0 = blue visible, se 1 = red visible
		if cube_states[i] == 0:
			blue.visible = true
			red.visible = false
		else:
			blue.visible = false
			red.visible = true

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_check_cube_click(event.position)

func _check_cube_click(mouse_pos: Vector2):
	for i in range(6):
		var blue_name = "BlueSprite" if i == 0 else "BlueSprite" + str(i + 1)
		var blue = get_node(blue_name) as Sprite2D
		var sprite_rect = Rect2(blue.global_position - blue.texture.get_size() / 2, blue.texture.get_size())
		
		if sprite_rect.has_point(mouse_pos):
			_toggle_cubes(i)
			_check_win()
			break

func _toggle_cubes(index: int):
	# Toggle cubo clicado
	_flip_cube(index)
	
	# Toggle esquerda
	if index > 0:
		_flip_cube(index - 1)
	
	# Toggle direita
	if index < 5:
		_flip_cube(index + 1)

func _flip_cube(index: int):
	var blue_name = "BlueSprite" if index == 0 else "BlueSprite" + str(index + 1)
	var red_name = "RedSprite" if index == 0 else "RedSprite" + str(index + 1)
	var blue = get_node(blue_name)
	var red = get_node(red_name)
	
	# Trocar estado: 0 <-> 1
	if cube_states[index] == 0:
		cube_states[index] = 1
		blue.visible = false
		red.visible = true
	else:
		cube_states[index] = 0
		blue.visible = true
		red.visible = false

func _check_win():
	# Verificar se todos são 1 (red)
	for state in cube_states:
		if state == 0:
			return
	
	$"../Event3".visible = true
	$"../Event2".visible = false
	$ExitB.visible = true
	
	$Laranja.visible = true
	$greeen/greeen6.visible = false
	
	print("GANHOU!")

	
