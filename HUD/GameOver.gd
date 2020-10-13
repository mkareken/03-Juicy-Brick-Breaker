extends Control


func _ready():
	$Label.text = "Your score was " + str(Global.score)





func _on_Quit_pressed():
	get_tree().quit()
