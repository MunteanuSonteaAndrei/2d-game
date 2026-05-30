extends CharacterBody2D

@export var _speed: float = 200.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var _direction := Input.get_vector("left", "right", "up", "down")
	
	velocity = _direction * _speed
	
	if _direction:
		animated_sprite_2d.play("walk")
		
		if _direction.x < 0:
			animated_sprite_2d.flip_h = true
		elif _direction.x > 0:
			animated_sprite_2d.flip_h = false
			
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()
