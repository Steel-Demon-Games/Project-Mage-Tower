extends CharacterBody2D
const SPEED = 200.0

@onready var timer = $Timer

var ballScene = preload("res://Characters/FireClass/projectiles/ball.tscn")
@onready var world =  get_parent()

var canShoot = true

func _physics_process(delta: float) -> void:
	# Add the gravity.dadad
	# Handle jump.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("normal_ability") and canShoot == true:
		canShoot = false
		var ball = ballScene.instantiate()
		var mousePos = get_global_mouse_position()
		var mouseCharacterVec = Vector2(mousePos.x - self.position.x, mousePos.y - self.position.y)
		ball.position = self.position + (mouseCharacterVec.normalized() * 25)
		ball.velocity = mouseCharacterVec.normalized() * 100
		world.add_child(ball)
		timer.start()


func _on_timer_timeout_Fireball() -> void:
	canShoot = true
