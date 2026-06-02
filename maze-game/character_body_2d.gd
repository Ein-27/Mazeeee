extends CharacterBody2D

@export var speed = 400
@onready var anim = $Animation

var is_teleporting: bool = false
var facing = "down"

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")

	if direction != Vector2.ZERO:
		facing = _get_facing(direction)

	velocity = direction * speed
	move_and_slide()

	var state = "walk" if direction != Vector2.ZERO else "idle"
	var anim_name = state + "_" + facing

	if anim.current_animation != anim_name:
		anim.play(anim_name)


func _get_facing(direction: Vector2) -> String:
	if abs(direction.x) > abs(direction.y):
		return "right" if direction.x > 0 else "left"
	return "down" if direction.y > 0 else "up"
	

	
	
	

	
