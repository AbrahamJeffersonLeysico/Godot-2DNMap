extends Area2D


func hide_buttons():
	$Button.hide()

func _on_body_entered(body):
	
	for each in get_tree().get_nodes_in_group("areas"):
		each.hidden_buttons()
	if body.is_in_group("player"):
		$Button.show()


func _on_Area2D_body_exited(body):
	
	if body.is_in_group("player"):
		$Button.hide()
