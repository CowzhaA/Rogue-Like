extends KinematicBody2D

onready var animated_sprite = $CharacterTexture

var speed = 150
var direction = Vector2.ZERO

#### BUILD-IT ####

func _ready() -> void:
	pass 

func _process(delta : float) -> void:
	move_and_slide(direction * speed)

func _input(event : InputEvent) -> void:
	
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	direction = direction.normalized()
	
	match(direction):
		Vector2.RIGHT : animated_sprite.play("MoveRight")
		Vector2.LEFT : animated_sprite.play("MoveLeft")
		Vector2.UP : animated_sprite.play("MoveUP")
		Vector2.DOWN : animated_sprite.play("MoveDown")
		Vector2.ZERO: animated_sprite.play("IdleDown")
	
#### LOGIC ####

