extends Node2D

# Sequência correta de cliques (índices dos cubos: 0 a 5)
var correct_sequence: Array = [0, 2, 4, 1, 3]  # Exemplo: clica cubo 1, 3, 5, 2, 4

# Sequência atual do jogador
var player_sequence: Array = []

# Estado dos cubos: 0 = blue, 1 = red
var cube_states: Array = [0, 0, 0, 0, 0]

func _ready():
	_update_all_cubes()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_check_cube_click(event.position)

func _check_cube_click(mouse_pos: Vector2):
	for i in range(5):
		var blue_name = "BlueSprite" if i == 0 else "BlueSprite" + str(i + 1)
		var blue = get_node(blue_name) as Sprite2D
		var sprite_rect = Rect2(blue.global_position - blue.texture.get_size() / 2, blue.texture.get_size())
		
		if sprite_rect.has_point(mouse_pos):
			_add_to_sequence(i)
			break

func _add_to_sequence(index: int):
	# Adicionar clique à sequência do jogador
	player_sequence.append(index)
	print("Sequência atual: ", player_sequence)
	
	# Obter o índice atual (último clique)
	var current_index = player_sequence.size() - 1
	
	# Verificar se o último clique está correto
	if current_index >= correct_sequence.size():
		# Clicou mais vezes que o necessário
		_fail()
		return
	
	if player_sequence[current_index] != correct_sequence[current_index]:
		# Sequência errada!
		_fail()
		return
	
	# Verificar se completou a sequência
	if player_sequence.size() == correct_sequence.size():
		_win()

func _fail():
	print("SEQUÊNCIA ERRADA!")
	
	# Todos os cubos ficam vermelhos
	for i in range(5):
		cube_states[i] = 1
	_update_all_cubes()
	
	# Resetar após 1 segundo
	await get_tree().create_timer(1.0).timeout
	reset_cubes()

func _win():
	$"../Event4".visible = true
	$"../Event3".visible = false
	$ClearEvent3b.visible = true
	$ExitB.visible = true
	$ExitB2.visible = false
	print("SEQUÊNCIA CORRETA!")
	# Adiciona aqui o que acontece quando ganha

func reset_cubes():
	# Resetar tudo para azul
	player_sequence.clear()
	for i in range(5):
		cube_states[i] = 0
	_update_all_cubes()
	print("Jogo resetado!")

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
	for i in range(5):
		_update_cube(i)
