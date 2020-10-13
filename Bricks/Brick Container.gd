extends Node2D

onready var Brick = load("res://Bricks/Brick.tscn")
var rows = 5
var columns = 7

onready var VP = get_viewport_rect().size
var B = Vector2(100,50)

var Levels = [
	[
		[6,6,6,6,6,6,6]
		,[5,5,5,5,5,5,5]
		,[4,4,4,4,4,4,4]
		,[3,3,3,3,3,3,3]
		,[2,2,2,2,2,2,2]
	]
	,[
		[6,6,6,6,6,6,6]
		,[5,4,4,4,4,4,5]
		,[6,4,0,0,0,4,6]
		,[5,4,4,4,4,4,6]
		,[6,6,6,6,6,6,6]
	]
	
	
	
]

func _physics_process(_delta):
	if get_child_count() == 0:
		Global.update_level(1)
		if Global.level > Levels.size():
			get_tree().change_scene("res://HUD/GameOver.tscn")
		else:
			start()


func _ready():
	start()




func start():
	for c in get_children():
		c.queue_free()
		
	var level = Levels[Global.level]
	var startx = (VP.x / 2) - ((B.x) * (level[0].size()/2))
	var starty = 100
	
	
	for r in range(level.size()):
		for c in range(level[r].size()):
			var strength = level[r][c]
			if strength > 0:
				var x = startx + (c * B.x)
				var y = starty + (r * B.y)
				var brick = Brick.instance()
				brick.position = Vector2(x,y)
				brick.set_strength((rows-1)-r)
				add_child(brick)
		
