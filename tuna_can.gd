extends RigidBody2D

var pos = Vector2(0,0)

func _input(event) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_E and global_position.distance_to(get_node("/root/Node2D/Player").global_position) < 100:
			if get_parent().name == "Node2D":
				reparent(get_node("/root/Node2D/Player/Mouth"))
				position = Vector2(0,0)
				set_deferred("freeze", true)
			else:
				if global_position.distance_to(get_node("/root/Node2D/Bowl").global_position) < 100:
					get_node("/root/Node2D/Bowl").get_child(1).texture = load("res://tuna-bowl.png")
					var win = load("res://win.tscn")
					get_parent().add_child(win)
					queue_free()
				pos = global_position
				reparent(get_node("/root/Node2D"))
				global_position = pos
				set_deferred("freeze", false)
