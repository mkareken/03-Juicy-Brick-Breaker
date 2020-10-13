extends Node2D

onready var Ball = load("res://Ball/Ball.tscn")
var speed = 200

func _ready():
	randomize()


func _physics_process(_delta):
	if get_child_count() == 0:
		load_ball()

func load_ball():
	var ball = Ball.instance()
	var impulse = Vector2.RIGHT*speed
	impulse = impulse.rotated(randf()*-PI)
	ball.apply_central_impulse(impulse)
	add_child(ball)
