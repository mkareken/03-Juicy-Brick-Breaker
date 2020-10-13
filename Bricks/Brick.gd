extends StaticBody2D

var strength = 0
var points = 100
var dying = false

onready var HUD = get_node("/root/Game/HUD")
onready var textures = [
	load("res://Assets/bubble.png")
]

func emit_particle(pos):
	if HUD.particle_blocks:
		$Particles2D.texture = textures[randi() % textures.size()]
		$Particles2D.emitting = true
		$Particles2D.global_position = pos

func _ready():
	randomize()
	
	

func _physics_process(_delta):
	if dying:
		queue_free()

func set_strength(s):
	if s <= 0:
		die()
	strength = s
	var x = strength * 100
	$Sprite.region_rect = Rect2(x, 0, 400, 200)
	points = strength * 100

func damage(_d):
	set_strength(strength - 1)
	Global.update_score(points)



func die():
	dying = true
