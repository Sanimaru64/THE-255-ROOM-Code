extends Control

# Cores dos cabos
const CORES = [Color.RED, Color.GREEN, Color.BLUE, Color.YELLOW]

var ordem_esquerda = [0, 1, 2, 3] 
var ordem_direita = [3, 2, 0, 1]   

var cabo_selecionado = null
var conexoes_corretas = 0

func _ready():
	randomize()
	criar_cabos()

func criar_cabos():

	for i in range(4):
		var btn = Button.new()
		btn.custom_minimum_size = Vector2(600, 400)
		btn.position = Vector2(-1480, 80 + i * 700)
		btn.modulate = CORES[ordem_esquerda[i]]
		btn.add_theme_font_size_override("font_size", 200)
		btn.connect("pressed", Callable(self, "_cabo_clicado").bind(ordem_esquerda[i], true))
		btn.name = "esq_" + str(ordem_esquerda[i])
		add_child(btn)
	
	# Criar cabos da direita
	for i in range(4):
		var btn = Button.new()
		btn.custom_minimum_size = Vector2(600, 400)
		btn.position = Vector2(1180, 80 + i * 700)
		btn.modulate = CORES[ordem_direita[i]]
		btn.add_theme_font_size_override("font_size", 200)
		btn.connect("pressed", Callable(self, "_cabo_clicado").bind(ordem_direita[i], false))
		btn.name = "dir_" + str(ordem_direita[i])
		add_child(btn)

func _cabo_clicado(cor_id, lado_esquerdo):
	if lado_esquerdo:
		cabo_selecionado = cor_id
	else:
		if cabo_selecionado != null and cabo_selecionado == cor_id:
			# Conexão correta!
			get_node("esq_" + str(cor_id)).disabled = true
			get_node("dir_" + str(cor_id)).disabled = true
			conexoes_corretas += 1
			
			# Desenhar linha
			var linha = Line2D.new()
			linha.add_point(get_node("esq_" + str(cor_id)).position + Vector2(500, 200))
			linha.add_point(get_node("dir_" + str(cor_id)).position + Vector2(200, 200))
			linha.default_color = CORES[cor_id]
			linha.width = 150
			add_child(linha)
			move_child(linha, 0)
			
			cabo_selecionado = null
			
			if conexoes_corretas == 4:
				var win = Label.new()
				add_child(win)
				$"../../Event2".visible = true
				$"../../Event2_1".visible = false
				$"../../Event1".visible = false
				$"../ExitB".visible = true

		else:
			cabo_selecionado = null
