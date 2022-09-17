extends KinematicBody2D

var velocity = Vector2.ZERO
export var move_speed = 300
export var jump_force = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(deltaTime):
	
	# Player input
	var x_move = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var jump_pressed = Input.is_action_just_pressed("jump")
	
	# X movement
	velocity.x = x_move * move_speed
	
	# Y movement
	velocity.y += 9.8
	if is_on_floor() and jump_pressed:
		velocity.y -= jump_force
	
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
