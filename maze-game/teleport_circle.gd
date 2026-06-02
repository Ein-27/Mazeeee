extends Area2D

@export var destination_circle: Area2D
@onready var anim = $AnimationPlayer
@onready var sfx = $AudioStreamPlayer2D

func _ready():
	body_entered.connect(_on_body_entered)

	if anim:
		anim.play("circle_animation")


func _on_body_entered(body):
	if not body.is_in_group("Character"):
		return

	if not body.has_method("get"):
		return

	if "is_teleporting" in body and body.is_teleporting:
		return

	body.is_teleporting = true

	if sfx:
		sfx.play()

	await get_tree().create_timer(0.1).timeout

	if destination_circle:
		body.global_position = destination_circle.global_position

	await get_tree().create_timer(0.3).timeout

	body.is_teleporting = false
