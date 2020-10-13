extends Control

var time = 0

var particle_paddle = true
var particle_walls = true
var particle_blocks = true
var paddle_face = true


func _ready():
	Global.connect("changed",self,"_on_Global_changed")
	update_score()
	update_lives()
	update_time()


func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_lives():
	$Lives.text = "Lives: " + str(Global.lives)

func update_time():
	$Time.text = "Time: " + str(time)



func _on_Timer_timeout():
	time += 1
	update_time()

func _on_Global_changed():
	update_score()
	update_lives()
