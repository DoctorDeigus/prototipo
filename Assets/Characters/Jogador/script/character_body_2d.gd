extends CharacterBody2D

# Velocidade de movimento do personagem (pixels por segundo)
@export var speed: float = 250.0

# Esta função é chamada a cada passo de física (ideal para movimento)
func _physics_process(delta):
	# 1. Captura a direção de entrada
	# O get_vector() retorna um Vector2 baseado nas ações de input (ex: 'ui_left', 'ui_right', etc.)
	# O vetor é normalizado para que o movimento na diagonal não seja mais rápido.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2. Calcula a nova velocidade
	# A velocidade é a direção multiplicada pela nossa constante de 'speed'
	if direction:
		velocity = direction * speed
	else:
		# Se nenhuma tecla estiver pressionada, o personagem para
		velocity = Vector2.ZERO
		
	# 3. Move o personagem
	# O move_and_slide() usa o valor da propriedade 'velocity' (CharacterBody2D)
	move_and_slide()
